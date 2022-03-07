package foo

import (
	"strings"
	"tool/exec"
	"encoding/json"
	"tool/file"

)



command: graph: {
	let a = #Node & {
		name: "a"
	}

	let b = #Node & {
		name: "b"
		inputs: [a]
	}
	let g = #Graph & {
		nodes: [b, a]
	}
	let j = json.Marshal(g)

    print: exec.Run & {

		cmd: "echo The graph is \n \(j)"
	}
	append: file.Create & {
		filename: "graph.json"
		contents: j
	}

}

who: *"World" | string @tag(who)
command: yell: {
	let x = strings.ToUpper(who)
	print: exec.Run & {

		cmd: "echo Hello \(x)! Welcome."
	}
}
