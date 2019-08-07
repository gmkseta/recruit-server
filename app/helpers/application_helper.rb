module ApplicationHelper
    def default_yield(sym)
        if content_for?(sym)
            yield(sym)
        else
            render "shared/#{sym.to_s}"
        end
    end
end
