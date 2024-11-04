(function() {
    const script = document.currentScript;
    const site = script?.dataset?.site || '';
    const currentDomain = window.location.hostname;
    const refParam = new URLSearchParams(window.location.search).get('ref');
    const getDomain = url => { try { return new URL(url).hostname; } catch { return null; } };
    const ref = [refParam, document.referrer].find(r => r && getDomain(r) !== currentDomain) || '';
    fetch(`${script.src.split('/script.js')[0]}/${site}/hit?path=${encodeURIComponent(window.location.pathname)}&ref=${encodeURIComponent(ref)}`);
})();