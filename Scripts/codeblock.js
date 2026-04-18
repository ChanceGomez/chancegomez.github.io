function formatCodeBlocks() {
    document.querySelectorAll('pre code').forEach(block => {
        const raw = block.innerHTML;

        const decoded = raw
            .replace(/&amp;/g, '&')
            .replace(/&lt;/g, '<')
            .replace(/&gt;/g, '>');

        const lines = decoded.split('\n');
        const indent = lines
            .filter(line => line.trim() !== '')
            .reduce((min, line) => {
                const spaces = line.match(/^\s*/)[0].length;
                return Math.min(min, spaces);
            }, Infinity);

        const trimmed = lines
            .map(line => line.slice(indent))
            .join('\n')
            .trim();

        const reEncoded = trimmed
            .replace(/&/g, '&amp;')
            .replace(/</g, '&lt;')
            .replace(/>/g, '&gt;');

        block.innerHTML = reEncoded;
    });
}