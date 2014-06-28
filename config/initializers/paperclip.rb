Paperclip::Attachment.default_options[:bucket] = 'player1herokuapp'
Paperclip::Attachment.default_options[:url] = ':s3_domain_url'
Paperclip::Attachment.default_options[:path] = ':attachment/:id/:style.:extension'
Paperclip::Attachment.default_options[:default_url] = 'default/:attachment/:style/missing.png'
