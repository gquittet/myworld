(setq gnus-select-method
      '(nnimap "Mail"
	       (nnimap-address "localhost")
	       (nnimap-stream network)
	       (nnimap-authenticator login)))

(setq user-mail-address "guillaume.quittet@gmail.com")
(setq gnus-ignored-from-addresses "gquittet")
(setq gnus-message-archive-group
      '((".*" "nnimap+myserver:Sent Items")))
