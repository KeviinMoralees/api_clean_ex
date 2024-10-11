defmodule ApiClean.ApplicationTest do
  use ExUnit.Case
  doctest ApiClean.Application
  alias ApiClean.Config.AppConfig

  test "test childrens" do
    assert ApiClean.Application.env_children(:test, %AppConfig{}) == []
  end
end
