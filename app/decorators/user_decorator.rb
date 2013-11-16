class UserDecorator < Draper::Decorator
  delegate_all
  decorates_finders
  decorates_association :picture
  decorates_association :projects
  decorates_association :tags

  def full_name
    first_name + ' ' + last_name
  end

  def street_name
    (first_name[0] + '-' + last_name[0..4]).to_s
  end

  def created_at
    h.content_tag :span, class: 'time' do
      object.created_at.strftime("%a %m/%d/%y")
    end
  end

end
