require 'delegate'

class Presenter < SimpleDelegator
  def initialize(object, template)
    @template = template
    super object
  end

private

  def t
    @template
  end
end
