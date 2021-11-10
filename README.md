<h1>DeCipher</h1>
Print output using a cool hacker-like effect.

<h2>Install</h2>
<ol>
    <li>Clone this repository</li>
    <li>From inside the repository run <code>./install.sh</code></li>
    <li>Open a new terminal</li>
</ol>

<h2>Usage</h2>
You can pass text through arguments or STDIN, like this:
<ol>
    <li><code>decp</code> and then it will wait for something to read</li>
    <li><code>decp "hello world"</code></li>
    <li><code>echo "hello world" | decp</code></li>
    <li><code>cat filename | decp</code></li>
</ol>

<i>Notice that since decryption speed is proportional to line length, if the line is too long glitches can happen.</i>