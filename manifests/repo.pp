class boxen::repo {
  $remote_add = "git remote add origin https://citrrus@bitbucket.org/${boxen::config::reponame}"
  $git_fetch = "git fetch -q origin"
  $git_reset = "git reset --hard origin/master"

  file { "${::boxen_home}/repo": ensure => directory }

  exec { "clone ${::boxen_home}/repo":
    command => "git init && ${remote_add} && ${git_fetch} && ${git_reset}",
    creates => "${::boxen_home}/repo/.git",
    cwd     => "${::boxen_home}/repo",
    require => Class['git'],
  }
}
