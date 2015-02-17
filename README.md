# Ruby and Rails profiling 101

## Example 1


Example app to show usage of rack-mini-profiler.

Uses mongodb.

to generate data use:
```
# Fake data
rake faker:employers
rake faker:jobs
rake faker:ontology_jobs

# Match jobs -> ontology_jobs
rake faker:match
```

