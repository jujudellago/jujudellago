I18n.default_locale = "fr"
#I18n.backend = I18n::Backend::Chain.new(I18n::Backend::ActiveRecord.new, I18n.backend)
#Translation = I18n::Backend::ActiveRecord::Translation

#I18n.backend = I18n::Backend::Database.new # registers the backend
#I18n.backend.cache_store = :memory_store
#I18n.backend.localize_text_tag = '##'      # optional: specify an alternate localize text tag, the default is ^^


