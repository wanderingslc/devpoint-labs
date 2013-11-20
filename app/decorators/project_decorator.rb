class ProjectDecorator < Draper::Decorator
  delegate_all
  decorates_finders
  decorates_association :user
  decorates_association :pictures
  decorates_association :tags


end
