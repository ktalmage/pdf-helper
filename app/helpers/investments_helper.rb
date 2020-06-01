module InvestmentsHelper
    def client_id_field(investment)
        if investment.client.nil?
          select_tag "investment[client_id]", options_from_collection_for_select(Client.all, :id, :name)
        else
          hidden_field_tag "investment[client_id]", investment.client_id
        end
      end
    end

    def user_id_field(investment)
        if investment.client.nil?
          select_tag "investment[user_id]", options_from_collection_for_select(User.all, :id, :name)
        else
          hidden_field_tag "investment[user_id]", investment.user_id
        end
      end
    end
end
