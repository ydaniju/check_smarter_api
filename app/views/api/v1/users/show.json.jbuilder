# frozen_string_literal: true
json.username @user.firstname + " " + @user.lastname
json.call(@user, :email)
json.total_checklists @user.checklists.count
json.created_at @user.created_at.strftime("%d/%m/%Y %H:%M:%S")
json.modified_at @user.updated_at.strftime("%d/%m/%Y %H:%M:%S")
