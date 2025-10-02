// ==UserScript==
// @name         Ctrl+F → Right Arrow in Metabase
// @namespace    http://tampermonkey.net/
// @version      1.0
// @description  将 Ctrl+F 转换为右箭头（光标右移）
// @author       You
// @match        https://example.com/*   <--- 将此处替换为 Metabase 实际 URL
// @grant        none
// ==/UserScript==

(function() {
    'use strict';
    console.log("✅ Tampermonkey Ctrl+F → Right Arrow in Metabase 已加载！");

    document.addEventListener('keydown', function(e) {
        if (e.ctrlKey && e.key.toLowerCase() === 'f') {
            e.preventDefault();
            e.stopPropagation();

            // 创建并触发一个 ArrowRight 键盘事件
            const rightArrowEvent = new KeyboardEvent('keydown', {
                key: 'ArrowRight',
                code: 'ArrowRight',
                keyCode: 39, // 兼容旧浏览器
                which: 39,
                bubbles: true,
                cancelable: true
            });

            // 在当前活动元素上触发
            const activeEl = document.activeElement;
            if (activeEl) {
                activeEl.dispatchEvent(rightArrowEvent);
            }

            // 可选：记录日志
            // console.log('Ctrl/Cmd+F 被转换为右箭头');
        }
    }, true); // 使用捕获阶段，提高拦截成功率
})();
