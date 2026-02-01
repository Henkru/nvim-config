return {
  cmd = {
    'clangd',
    '--fallback-style={BasedOnStyle: LLVM, IndentWidth: 4, TabWidth: 4, UseTab: Never, SortIncludes: Never}',
    '--header-insertion=never',
  },
}
