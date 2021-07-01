# frozen_string_literal: true

module ApplicationHelper
  def image_tag_placeholder(source, options = {})
    if source.blank?
      image_tag source, options
    else
      image_tag 'https://dummyimage.com/600x400/c4/0011ff.jpg', options
    end
  end

  def current_class?(test_path)
    return 'active' if request.path == test_path

    ''
  end
end
