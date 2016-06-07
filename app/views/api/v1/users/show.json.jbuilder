# frozen_string_literal: true
json.username @user.firstname + " " + @user.lastname
json.call(@user, :email)
json.total_checklists @user.checklists.count
