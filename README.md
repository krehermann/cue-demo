# cue-demo
Following example from https://luth.io/blog/2022/01/practical-cue-example/
cd config 
cue mod init github.com/krehermann/cue-demo-mod/config
go mod init github.com/krehermann/cue-demo
go mod tidy
cd config
cue get go . 

$tree cue.mod     
cue.mod
├── gen
│   └── github.com
│       └── krehermann
│           └── cue-demo
│               └── config
│                   └── types_go_gen.cue
├── module.cue
├── pkg
└── usr

<Make file config/src/spec.cue>

Notes for self:

Originally did
...
cue mod init github.com/krehermann/cue-demo/config
go mod init github.com/krehermann/cue-demo
...


And... Bang head against the wall for an hour with this error

cue export ./src
import failed: no CUE files in github.com/krehermann/cue-demo/config:
    ./src/spec.cue:5:8

WTF? the source is there as in the tree listing

hack...

and hack...

and figure out that the fix is to move the generated code from

github.com/krehermann/cue-demo/config 
to literally anything else that ends with /config (and updating the import in src/spec.cue)

after some reflection, I would guess that this is a collision between the cue mod name and the go mod name. Given that cue is implemented in golang, it seems plausible