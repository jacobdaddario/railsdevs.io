class Developers::Like < ApplicationRecord
  belongs_to :business
  belongs_to :prompt_response, class_name: "Developers::PromptResponse"
end
