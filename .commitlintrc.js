module.exports = {
  extends: ['@commitlint/config-conventional'],
  rules: {
    'type-enum': [
      2,
      'always',
      [
        'feat',     // New feature
        'fix',      // Bug fix
        'docs',     // Documentation
        'style',    // Code style changes
        'refactor', // Code refactoring
        'test',     // Adding tests
        'chore',    // Maintenance tasks
        'perf',     // Performance improvements
        'ci',       // CI/CD changes
        'build',    // Build system changes
        'revert'    // Reverting changes
      ]
    ],
    'scope-enum': [
      2,
      'always',
      [
        'atoms', 'molecules', 'organisms', 'templates',
        'foundation', 'navigation', 'feedback', 'layout',
        'data-display', 'responsive', 'animation', 'accessibility',
        'docs', 'ci', 'build', 'deps', 'example', 'screens'
      ]
    ],
    'subject-case': [2, 'never', ['pascal-case', 'upper-case']],
    'subject-empty': [2, 'never'],
    'subject-full-stop': [2, 'never', '.'],
    'header-max-length': [2, 'always', 100]
  }
};
