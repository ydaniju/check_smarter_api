# frozen_string_literal: true
json.call(@checklist, :id, :title, :votes, :comments)
json.created_by @checklist.user.firstname + " " + @checklist.user.lastname
json.created_at @checklist.created_at.strftime("%d/%m/%Y %H:%M:%S")
json.modified_at @checklist.updated_at.strftime("%d/%m/%Y %H:%M:%S")
