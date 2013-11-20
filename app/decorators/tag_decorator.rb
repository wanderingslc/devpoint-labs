class TagDecorator < Draper::Decorator
  delegate_all
  decorates_finders
  decorates_association :taggable


end
