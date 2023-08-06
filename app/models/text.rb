class Text < ApplicationRecord
  searchkick word_start: [:prompt]
end
