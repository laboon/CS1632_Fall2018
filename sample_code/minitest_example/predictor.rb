# Just like "public class Predictor { ... } in Java
# Note we use CamelCase for classes

class Predictor

  # Instance-level variable.  ALL_CAPITALS_SNAKE_CASE implies that
  # it is a constant.
  # Note again that variables are not typed.  This is an array but
  # we do not have to declare it as an array, we can just put an array
  # there.

  ANSWERS = ["Yes",
             "No",
             "Ask again later",
             "Maybe",
             "Future is hazy",
             "It is certain",
             "It is doubtful",
             "My sources say no",
             "Outlook is good",
             "Outlook is not so good"
            ]

  # Methods are defined by "def" and then a list of parameters, if any.
  # Parentheses are optional.

  def ask question
    # Throw an exception labeled "That is not a question" unless
    # it is a valid question.
    raise "That is not a question!" unless question_valid question

    # ALL methods in Ruby return a value.  If there is no explicit
    # "return", the result of the last statement is returned as the
    # result of the method.
    # This will return a random result from the elements in ANSWERS
    # array.  Imagine how many lines of code this would be in Java!
    ANSWERS.sample
  end

  # A method with no parameters.  It will always return "SHAKE SHAKE SHAKE"
  def shake
    "SHAKE SHAKE SHAKE"
  end

  # A method which will print SHAKE SHAKE SHAKE to the console

  def print_shake
    puts "SHAKE SHAKE SHAKE"
  end

  # All methods after this declaration are private
  # This acts just like Java's private - methods below can be called
  # by other methods in this class, but not externally.
  # Note that this is technically a lie.  You can get around this using
  # .send(:method_name) and bypass access restrictions.
  # Note that you do not need to write "private" in front of individual
  # methods

  private

  # Note that we use snake_case for methods and variables

  def question_valid question
    # If the question is a string (and not a number, or array, or
    # whatever) AND the last character is a question mark, we
    # assume it is a question.
    # Using a negative as an array index counts backward from the
    # last element.  So question[-1] is the last element
    question.is_a?(String) && question[-1] == "?"
  end

end
