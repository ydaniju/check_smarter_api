# frozen_string_literal: true
json.call(@checklist, :id, :title, :votes, :comments)
json.created_by @checklist.user.firstname
