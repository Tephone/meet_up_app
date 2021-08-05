module ApplicationHelper
  def languages_array
    Language.all.map { |language| [t(language.name), language.id] }
  end
end
