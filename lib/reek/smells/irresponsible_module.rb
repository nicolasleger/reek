require 'reek/smells/smell_detector'
require 'reek/code_comment'

# Part of Reek's core
module Reek
  module Smells

    #
    # It is considered good practice to annotate every class and module
    # with a brief comment outlining its responsibilities.
    #
    class IrresponsibleModule < SmellDetector

      def self.contexts      # :nodoc:
        [:class]
      end

      #
      # Checks the given class or module for a descriptive comment.
      # Remembers any smells found.
      #
      def examine_context(ctx)
        comment = CodeComment.new(ctx.exp.comments)
        found(ctx, "has no descriptive comment") unless comment.is_descriptive?
      end
    end
  end
end
