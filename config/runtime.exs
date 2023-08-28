import Config

case config_env() do
  :dev ->
    Code.require_file("runtime.dev.exs","config")
    _ -> raise "Unknown environment #{config_env()}"
end
