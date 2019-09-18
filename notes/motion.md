Motions and Operators
================================================

### Basics
Motion commands can be used after an operator command, to operate on the text
that was moved over.

*Example*: `de` - delete to end of word.

Instead of first giving the operator and then a motion you can use Visual mode:
mark the start of the text with `v`, move the cursor to the end of the text that
is to be affected and then hit the operator. Visual mode has limited redo
functionality.

*Example*: `ved` - delete to end of word.

### Linewise or Characterwise
A motion is either linewise or characterwise. For linewise motions, all lines
including the entire start and end line are affected by an operation. For
characterwise motions, just the characters between the the start and end
character are affected by an operation.

### Inclusive or Exclusive
A characterwise motion is either inclusive or exclusive. When inclusive, the
last character of the motion (towards the end of the buffer) is affected by an
operation. When exclusive, the last character of the motion is **not** affected by
an operation. There are two [general exceptions][1].

[1]: http://vimdoc.sourceforge.net/htmldoc/motion.html#exclusive

### Forcing A Motion To Be Linewise, Characterwise Or Blockwise
When a motion is not of the type you would like to use, you can force another
type by using `v`, `V` or `CTRL-V` *just after the operator*.

* `v`
	* When the motion is linewise, force it to work characterwise (exclusive).
	* When the motion is already characterwise, toggle inclusive/exclusive.
* `V`
	* When the motion is characterwise, force it to work linewise.
* `CTRL-V`
	* Force the motion to work blockwise. This works like Visual block mode
	selection, with the corners defined by the cursor position before and
	after the motion.

*Examples*:
* `dj` - deletes two lines.
* `dvj` - deletes from the cursor position until the character below the cursor.
* `d<C-v>j` - deletes the character under the cursor and the character below the cursor.

-----------------------------------------------------------

List of Motions
================================================

Motion            | Linewise (L) or Characterwise \(C\) | Inclusive (I) or Exclusive (E)
---               | :---:                               | :---:
`j`               | L                                   | N/A
`k`               | L                                   | N/A
`-`               | L                                   | N/A
`+`               | L                                   | N/A
`_`               | L                                   | N/A
`G`               | L                                   | N/A
`gg`              | L                                   | N/A
`H`               | L                                   | N/A
`M`               | L                                   | N/A
`L`               | L                                   | N/A
`'{mark}`         | L                                   | N/A
`:[range]`        | L                                   | N/A
`$`               | C                                   | I
`g_`              | C                                   | I
`g$`              | C                                   | I
`f{char}`         | C                                   | I
`t{char}`         | C                                   | I
`{count}%`        | C                                   | I
`e`               | C                                   | I
`E`               | C                                   | I
`ge`              | C                                   | I
`gE`              | C                                   | I
`h`               | C                                   | E
`l`               | C                                   | E
`0`               | C                                   | E
`^`               | C                                   | E
`g0`              | C                                   | E
`g^`              | C                                   | E
`gm`              | C                                   | E
`\|`              | C                                   | E
`F{char}`         | C                                   | E
`T{char}`         | C                                   | E
`gk`              | C                                   | E
`gj`              | C                                   | E
`[count]go`       | C                                   | E
`w`               | C                                   | E
`W`               | C                                   | E
`b`               | C                                   | E
`B`               | C                                   | E
`)`               | C                                   | E
`(`               | C                                   | E
`{`               | C                                   | E
`}`               | C                                   | E
`]}`              | C                                   | E
`[{`              | C                                   | E
`])`              | C                                   | E
`[(`              | C                                   | E
`]m`              | C                                   | E
`[m`              | C                                   | E
`]M`              | C                                   | E
`[M`              | C                                   | E
`]*` or `]/`      | C                                   | E
`[*` or `[/`      | C                                   | E
`` `{mark}``      | C                                   | E
`]]`              | C                                   | E
`[[`              | C                                   | E
`][`              | C                                   | E
`[]`              | C                                   | E
`:call FindEnd()` | C                                   | E

List of Operators
================================================
`c`

`d`

`y`

`~`

`g~`

`gu`

`gU`

`!`

`=`

`gq`

`g?`

`>`

`<`

`zf`

`g@`
