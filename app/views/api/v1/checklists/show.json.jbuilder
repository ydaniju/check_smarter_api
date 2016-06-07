# frozen_string_literal: true
json.call(@checklist, :title, :votes, :comments)
json.created_by @checklist.user.firstname
