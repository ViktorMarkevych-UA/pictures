module CategoriesHelper

  def return_error_list
    @category.errors.full_messages.collect{ |msg| "<li>#{msg}</li>" }.join('').html_safe
  end
end
