class users {

  user { "faye":
    ensure         => "present",
    shell         => "/bin/bash",
    managehome         => true,
  }

}
