class PurchaseTicketsController < ApplicationController
  def new
    @purchase_ticket = current_student.purchase_tickets.new
  end

  def create
    purchase_ticket = current_student.purchase_tickets.new(purchase_ticket_params)
    if purchase_ticket.save
      redirect_to student_homes_path, notice: 'チケットを購入しました'
    else
      render :new
    end
  end

  private

  def purchase_ticket_params
    params.require(:purchase_ticket).permit(:ticket_id)
  end
end
