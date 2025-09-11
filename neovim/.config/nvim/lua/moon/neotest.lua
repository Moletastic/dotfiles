require('neotest').setup({
  adapters = {
    require('neotest-jest')({
      jestCommand = "npx jest ",
      jestConfigFile = "jest.config.mjs",
    }),
  }
})
