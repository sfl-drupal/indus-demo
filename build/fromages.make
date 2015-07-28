core = 7.x
projects[drupal][version] = 7.38
api = 2

defaults[projects][l10n_url] = http://ftp.drupal.org/files/translations/l10n_server.xml

; Reblochon Drupal profile
projects[reblochon][type] = profile
projects[reblochon][download][type] = git
projects[reblochon][download][url] = git@github.com:philippemouchel/reblochon.git
projects[reblochon][download][branch] = 7.x

; Beaufort Drupal theme
projects[beaufort][type] = theme
projects[beaufort][download][type] = git
projects[beaufort][download][url] = git@github.com:philippemouchel/beaufort.git
projects[beaufort][download][branch] = 7.x

; Époisses Drupal module
projects[epoisses][type] = module
projects[epoisses][download][type] = git
projects[epoisses][download][url] = git@github.com:philippemouchel/epoisses.git
projects[epoisses][download][branch] = 7.x
projects[epoisses][subdir] = custom

; Roquefort Drupal features
projects[roquefort][type] = module
projects[roquefort][download][type] = git
projects[roquefort][download][url] = git@github.com:philippemouchel/roquefort.git
projects[roquefort][download][branch] = 7.x
projects[roquefort][subdir] = custom
