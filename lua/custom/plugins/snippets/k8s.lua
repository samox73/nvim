local ls = require 'luasnip'
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require 'luasnip.util.events'
local ai = require 'luasnip.nodes.absolute_indexer'
local extras = require 'luasnip.extras'
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local conds = require 'luasnip.extras.expand_conditions'
local postfix = require('luasnip.extras.postfix').postfix
local types = require 'luasnip.util.types'
local parse = require('luasnip.util.parser').parse_snippet
local ms = ls.multi_snippet
local k = require('luasnip.nodes.key_indexer').new_key

ls.add_snippets('yaml', {
  s(
    'HelmRelease',
    fmt(
      [[apiVersion: helm.toolkit.fluxcd.io/v2
kind: HelmRelease
metadata:
  name: {}
  namespace: {}
spec:
  interval: 5m
  install:
    crds: CreateReplace
  upgrade:
    crds: CreateReplace
  chart:
    spec:
      chart: {}
      version: {}
      sourceRef:
        kind: HelmRepository
        name: {}
        namespace: {}
  values:
    ]],
      { i(1, 'NAME'), i(2, 'NAMESPACE'), i(3, 'CHART'), i(4, 'VERSION'), i(5, 'NAME'), i(6, 'NAMESPACE') }
    )
  ),

  s(
    'KubeNamespace',
    fmt(
      [[apiVersion: v1
kind: Namespace
metadata:
  name: {}
  ]],
      { i(1, 'NAME') }
    )
  ),

  s(
    'HelmRepository',
    fmt(
      [[apiVersion: source.toolkit.fluxcd.io/v1
kind: HelmRepository
metadata:
  name: {}
spec:
  interval: 5m0s
  url: {}
]],
      { i(1, 'NAME'), i(2, 'URL') }
    )
  ),
})
