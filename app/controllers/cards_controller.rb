class CardsController < ApplicationController
  require 'payjp'

  def show
    Post.find(params[:id])
  end

  def new
    # public_key = 'pk_test_f0d7a1fca33f08a051b86659'
    card = Card.where(user_id: current_user.id)
  end

  def pay #payjpとCardのデータベース作成を実施します。
    Payjp.api_key = "sk_test_db2764f9c206b9cfdb4a9888"
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      description: '登録テスト', #なくてもOK
      email: current_user.email, #なくてもOK
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      ) #念の為metadataにuser_idを入れましたがなくてもOK
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to "/"
      else
        redirect_to action: "pay"
      end
    end
  end

  def show #クレジット購入
    Post.find(params[:id])
    if user_signed_in?
      card = current_user.card
      if card.blank?
        redirect_to action: "new"
        flash[:alert] = '購入にはクレジットカード登録が必要です'
      else

        @post = Post.find(params[:id])
        card = current_user.card
        Payjp.api_key = "sk_test_db2764f9c206b9cfdb4a9888"
        Payjp::Charge.create(
        amount: @post.price, #支払金額
        customer: card.customer_id, #顧客ID
        currency: 'jpy', #日本円
        )
        # if @post.update(status: 1, buyer_id: current_user.id)
          # flash[:notice] = '購入しました。'
          # redirect_to "/"
        # else
        #   flash[:alert] = '購入に失敗しました。'
        #   redirect_to "/"
        end
      end
    # else
    #   redirect_to "/users/sign_up"
    #   flash[:alert] = '購入には新規登録が必要です'
    # end
  end

end
