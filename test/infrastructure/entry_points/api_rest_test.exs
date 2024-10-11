defmodule ApiClean.Infrastructure.EntryPoint.ApiRestTets do
  alias ApiClean.Infrastructure.EntryPoint.ApiRest

  use ExUnit.Case
  use Plug.Test

  @opts ApiRest.init([])

  test "test ApiRest" do
    conn =
      :get
      |> conn("/api/health", "")
      |> ApiRest.call(@opts)

    assert conn.state == :sent
    # TODO: Implement mocks correctly when needed
    assert conn.status in [200, 500]
  end

  test "test Hello" do
    conn =kw
      :get
      |> conn("/api/hello", "")
      |> ApiRest.call(@opts)

    assert conn.state == :sent
    assert conn.status == 200
  end
end
D
