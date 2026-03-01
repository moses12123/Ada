<!DOCTYPE html>

<html lang="fr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ArbrLearn 🌳</title>
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800;900&family=JetBrains+Mono:wght@400;600&display=swap" rel="stylesheet">
<style>
:root{
  --green:#58cc02;--green-d:#46a302;--green-l:#d7ffb8;
  --blue:#1cb0f6;--blue-d:#0c8fc5;--blue-l:#ddf4ff;
  --purple:#ce82ff;--purple-d:#9b2dca;--purple-l:#f3d6ff;
  --yellow:#ffc800;--yellow-d:#e6a700;--yellow-l:#fff9e6;
  --red:#ff4b4b;--red-d:#d93636;--red-l:#ffdfe0;
  --orange:#ff9600;--orange-d:#e67e00;--orange-l:#fff0d6;
  --pink:#ff70a6;--teal:#00cba9;
  --bg:#f0f4f8;--white:#fff;--dark:#1f2937;--gray:#6b7280;--gray-l:#e5e7eb;--gray-ll:#f9fafb;
  --shadow:0 4px 0;--shadow-h:0 6px 0;
  --radius:16px;--radius-sm:10px;
}
*{box-sizing:border-box;margin:0;padding:0;}
html{scroll-behavior:smooth;}
body{font-family:'Nunito',sans-serif;background:var(--bg);color:var(--dark);min-height:100vh;}

/* ═══ SPLASH ═══ */
#splash{position:fixed;inset:0;z-index:9999;background:linear-gradient(145deg,#58cc02,#1cb0f6,#ce82ff);display:flex;flex-direction:column;align-items:center;justify-content:center;gap:16px;transition:opacity .7s;}
#splash.hide{opacity:0;pointer-events:none;}
.sp-owl{font-size:7rem;animation:owlBounce 1s ease-in-out infinite alternate;}
@keyframes owlBounce{from{transform:translateY(0) rotate(-5deg);}to{transform:translateY(-18px) rotate(5deg);}}
#splash h1{font-size:3rem;font-weight:900;color:#fff;letter-spacing:-1px;text-shadow:0 4px 0 rgba(0,0,0,.15);}
#splash p{color:rgba(255,255,255,.85);font-weight:700;font-size:1.1rem;}
.sp-dots{display:flex;gap:8px;margin-top:8px;}
.sp-dot{width:10px;height:10px;border-radius:50%;background:rgba(255,255,255,.5);animation:dotPulse 1.2s ease-in-out infinite;}
.sp-dot:nth-child(2){animation-delay:.2s;}
.sp-dot:nth-child(3){animation-delay:.4s;}
@keyframes dotPulse{0%,100%{opacity:.4;transform:scale(1);}50%{opacity:1;transform:scale(1.3);}}

/* ═══ AUTH ═══ */
#authWrap{display:none;position:fixed;inset:0;z-index:8888;background:rgba(0,0,0,.55);backdrop-filter:blur(10px);align-items:center;justify-content:center;}
#authWrap.show{display:flex;}
.auth-card{background:#fff;border-radius:24px;width:min(92vw,430px);overflow:hidden;box-shadow:0 24px 60px rgba(0,0,0,.25);animation:cardIn .35s cubic-bezier(.34,1.56,.64,1);}
@keyframes cardIn{from{transform:scale(.75) translateY(40px);opacity:0;}to{transform:scale(1) translateY(0);opacity:1;}}
.auth-top{background:linear-gradient(135deg,var(–green),var(–blue));padding:28px;text-align:center;color:#fff;}
.auth-top .owl{font-size:3.5rem;display:block;margin-bottom:8px;}
.auth-top h2{font-size:1.7rem;font-weight:900;text-shadow:0 2px 0 rgba(0,0,0,.1);}
.auth-top p{opacity:.85;font-weight:600;font-size:.9rem;margin-top:4px;}
.auth-body{padding:28px;}
.tabs{display:flex;background:var(–gray-l);border-radius:12px;padding:4px;margin-bottom:22px;}
.tab{flex:1;padding:10px;border:none;background:none;border-radius:9px;font-family:‘Nunito’,sans-serif;font-weight:700;font-size:.9rem;cursor:pointer;color:var(–gray);transition:all .2s;}
.tab.on{background:#fff;color:var(–dark);box-shadow:0 2px 8px rgba(0,0,0,.1);}
.fld{margin-bottom:14px;}
.fld label{display:block;font-weight:800;font-size:.82rem;margin-bottom:5px;color:var(–dark);}
.fld input{width:100%;padding:13px 15px;border:2.5px solid var(–gray-l);border-radius:var(–radius-sm);font-family:‘Nunito’,sans-serif;font-size:.97rem;font-weight:600;outline:none;transition:border-color .2s;}
.fld input:focus{border-color:var(–blue);}
.avs{display:flex;gap:8px;flex-wrap:wrap;margin-bottom:16px;}
.av{font-size:1.8rem;padding:8px 10px;border-radius:10px;cursor:pointer;border:2.5px solid transparent;background:var(–gray-l);transition:all .2s;}
.av:hover,.av.on{border-color:var(–blue);background:var(–blue-l);transform:scale(1.12);}
.btn-main{width:100%;padding:15px;background:var(–green);border:none;border-radius:var(–radius-sm);color:#fff;font-family:‘Nunito’,sans-serif;font-weight:900;font-size:1.05rem;cursor:pointer;box-shadow:0 4px 0 var(–green-d);transition:all .15s;letter-spacing:.3px;}
.btn-main:hover{transform:translateY(-2px);box-shadow:0 6px 0 var(–green-d);}
.btn-main:active{transform:translateY(2px);box-shadow:0 1px 0 var(–green-d);}

/* ═══ APP ═══ */
#app{display:none;}
#app.on{display:block;}

/* ═══ TOPBAR ═══ */
.topbar{position:fixed;top:0;left:0;right:0;height:65px;background:#fff;border-bottom:2.5px solid var(–gray-l);display:flex;align-items:center;justify-content:space-between;padding:0 16px;z-index:999;}
.logo{font-size:1.5rem;font-weight:900;color:var(–green);display:flex;align-items:center;gap:7px;cursor:pointer;}
.logo span{font-size:1.3rem;}
.top-nav{display:flex;gap:2px;}
.tn{padding:9px 14px;border:none;background:none;border-radius:12px;font-family:‘Nunito’,sans-serif;font-weight:700;font-size:.85rem;cursor:pointer;color:var(–gray);display:flex;align-items:center;gap:5px;transition:all .2s;white-space:nowrap;}
.tn:hover{background:var(–gray-l);color:var(–dark);}
.tn.on{background:var(–green-l);color:var(–green-d);}
.tn .ni{font-size:1rem;}
.top-r{display:flex;align-items:center;gap:10px;}
.pill{border-radius:20px;padding:5px 13px;font-weight:800;font-size:.88rem;display:flex;align-items:center;gap:5px;}
.pill.xp{background:var(–yellow-l);border:2px solid var(–yellow);color:var(–yellow-d);}
.pill.str{background:var(–orange);color:#fff;}
.pill.gem{background:var(–blue-l);border:2px solid var(–blue);color:var(–blue-d);}
.uav{width:38px;height:38px;border-radius:50%;background:var(–purple-l);border:2.5px solid var(–purple);font-size:1.3rem;display:flex;align-items:center;justify-content:center;cursor:pointer;}

/* ═══ PAGES ═══ */
.pg{display:none;padding-top:75px;min-height:100vh;}
.pg.on{display:block;}

/* ═══ HOME ═══ */
.hero{background:linear-gradient(135deg,var(–green) 0%,var(–teal) 100%);padding:36px 20px;text-align:center;position:relative;overflow:hidden;}
.hero::before{content:‘🌲’;position:absolute;font-size:100px;opacity:.12;left:-10px;bottom:-10px;}
.hero::after{content:‘🌳’;position:absolute;font-size:80px;opacity:.12;right:-5px;top:-5px;}
.hero h1{font-size:clamp(1.7rem,4vw,2.5rem);font-weight:900;color:#fff;text-shadow:0 3px 0 rgba(0,0,0,.15);margin-bottom:6px;}
.hero p{color:rgba(255,255,255,.88);font-weight:700;font-size:1rem;}
.home-body{max-width:920px;margin:0 auto;padding:24px 16px;}

/* Daily goal */
.daily-box{background:#fff;border-radius:var(–radius);padding:20px;box-shadow:var(–shadow) rgba(0,0,0,.08);margin-bottom:20px;display:flex;align-items:center;gap:16px;}
.daily-icon{font-size:2.5rem;}
.daily-info{flex:1;}
.daily-info h3{font-weight:900;font-size:1rem;margin-bottom:6px;}
.daily-bar{height:12px;background:var(–gray-l);border-radius:6px;overflow:hidden;}
.daily-fill{height:100%;background:linear-gradient(90deg,var(–yellow),var(–orange));border-radius:6px;transition:width .6s ease;}
.daily-txt{font-size:.8rem;color:var(–gray);font-weight:600;margin-top:5px;}

.sec-lbl{font-size:.78rem;font-weight:900;text-transform:uppercase;letter-spacing:.1em;color:var(–gray);margin-bottom:14px;}
.courses-grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(260px,1fr));gap:14px;margin-bottom:28px;}
.cc{background:#fff;border-radius:var(–radius);padding:22px;box-shadow:var(–shadow) rgba(0,0,0,.08);cursor:pointer;border:2.5px solid transparent;transition:all .22s;position:relative;overflow:hidden;}
.cc:hover{transform:translateY(-4px);box-shadow:var(–shadow-h) rgba(0,0,0,.1);border-color:var(–green);}
.cc.lock{opacity:.6;cursor:default;}
.cc.lock::after{content:‘🔒’;position:absolute;top:14px;right:14px;font-size:1.2rem;}
.cc-icon{font-size:2.6rem;margin-bottom:10px;}
.cc-title{font-size:1rem;font-weight:900;margin-bottom:5px;}
.cc-desc{font-size:.82rem;color:var(–gray);line-height:1.5;margin-bottom:12px;}
.cc-prog{height:8px;background:var(–gray-l);border-radius:4px;overflow:hidden;margin-bottom:6px;}
.cc-fill{height:100%;background:linear-gradient(90deg,var(–green),var(–blue));border-radius:4px;}
.cc-meta{font-size:.78rem;color:var(–gray);font-weight:700;}
.cc-badge{position:absolute;top:12px;right:12px;background:var(–green);color:#fff;border-radius:20px;padding:3px 9px;font-size:.72rem;font-weight:800;}

/* Leaderboard mini */
.lb-mini{background:#fff;border-radius:var(–radius);padding:20px;box-shadow:var(–shadow) rgba(0,0,0,.08);margin-bottom:20px;}
.lb-mini h3{font-weight:900;font-size:1rem;margin-bottom:14px;display:flex;align-items:center;gap:7px;}
.lb-row{display:flex;align-items:center;gap:10px;padding:8px 0;border-bottom:1px solid var(–gray-l);}
.lb-row:last-child{border:none;}
.lb-rank{font-weight:900;font-size:.9rem;width:22px;color:var(–gray);}
.lb-rank.g1{color:var(–yellow-d);}
.lb-rank.g2{color:var(–gray);}
.lb-rank.g3{color:var(–orange-d);}
.lb-av{font-size:1.3rem;}
.lb-name{flex:1;font-weight:700;font-size:.9rem;}
.lb-xp{font-weight:900;font-size:.9rem;color:var(–yellow-d);}

/* ═══ COURS ═══ */
.cours-wrap{max-width:820px;margin:0 auto;padding:24px 16px;}
.path-header{background:#fff;border-radius:var(–radius);padding:20px;box-shadow:var(–shadow) rgba(0,0,0,.08);margin-bottom:20px;display:flex;align-items:center;gap:14px;}
.path-icon{font-size:2.5rem;}
.path-info h2{font-size:1.2rem;font-weight:900;margin-bottom:4px;}
.path-info p{font-size:.85rem;color:var(–gray);font-weight:600;}
/* skill tree */
.skill-tree{display:flex;flex-direction:column;align-items:center;gap:0;}
.skill-row{display:flex;justify-content:center;gap:20px;margin-bottom:8px;}
.skill-node{display:flex;flex-direction:column;align-items:center;cursor:pointer;position:relative;}
.skill-node .connector{width:3px;height:32px;background:var(–gray-l);margin:0 auto;}
.skill-node .connector.done{background:var(–green);}
.skill-btn{width:72px;height:72px;border-radius:50%;border:4px solid;display:flex;flex-direction:column;align-items:center;justify-content:center;transition:all .22s;box-shadow:0 4px 0;position:relative;font-size:1.8rem;}
.skill-btn.done{background:var(–green);border-color:var(–green-d);box-shadow:0 4px 0 var(–green-d);color:#fff;}
.skill-btn.done:hover{transform:translateY(-3px);}
.skill-btn.active{background:#fff;border-color:var(–blue);box-shadow:0 4px 0 var(–blue-d);animation:pulse 2s infinite;}
@keyframes pulse{0%,100%{box-shadow:0 4px 0 var(–blue-d),0 0 0 0 rgba(28,176,246,.4);}50%{box-shadow:0 4px 0 var(–blue-d),0 0 0 12px rgba(28,176,246,0);}}
.skill-btn.locked{background:var(–gray-l);border-color:var(–gray);box-shadow:0 4px 0 #999;color:var(–gray);cursor:not-allowed;}
.skill-lbl{font-size:.7rem;font-weight:800;margin-top:6px;text-align:center;max-width:80px;}
/* lesson modal */
.lesson-modal{display:none;position:fixed;inset:0;z-index:2000;background:rgba(0,0,0,.5);align-items:center;justify-content:center;backdrop-filter:blur(6px);}
.lesson-modal.show{display:flex;}
.lm-box{background:#fff;border-radius:24px;width:min(95vw,680px);max-height:88vh;overflow-y:auto;box-shadow:0 20px 60px rgba(0,0,0,.3);animation:cardIn .3s cubic-bezier(.34,1.56,.64,1);}
.lm-head{position:sticky;top:0;background:#fff;border-bottom:2px solid var(–gray-l);padding:16px 20px;display:flex;align-items:center;justify-content:space-between;z-index:1;}
.lm-close{background:var(–gray-l);border:none;border-radius:50%;width:36px;height:36px;font-size:1.1rem;cursor:pointer;display:flex;align-items:center;justify-content:center;transition:background .2s;}
.lm-close:hover{background:var(–red-l);}
.lm-body{padding:24px;}
.lm-body p{line-height:1.8;font-size:.95rem;margin-bottom:12px;}
.lm-body strong{color:var(–green-d);}
.hbox{background:var(–blue-l);border-left:4px solid var(–blue);border-radius:0 10px 10px 0;padding:14px;margin:12px 0;font-weight:700;font-size:.9rem;}
.tipbox{background:var(–yellow-l);border-left:4px solid var(–yellow-d);border-radius:0 10px 10px 0;padding:14px;margin:12px 0;font-size:.88rem;font-weight:600;}
.cb{background:#1e2a3a;border-radius:12px;padding:16px;font-family:‘JetBrains Mono’,monospace;font-size:.82rem;color:#86efac;margin:12px 0;white-space:pre;overflow-x:auto;line-height:1.7;}
.vg{display:grid;grid-template-columns:1fr 1fr;gap:8px;margin:12px 0;}
.vc{background:var(–purple-l);border-radius:10px;padding:10px 14px;}
.vc .vt{font-weight:900;font-size:.85rem;color:var(–purple-d);}
.vc .vd{font-size:.78rem;margin-top:3px;line-height:1.4;}
.tree-viz{background:#1e2a3a;border-radius:10px;padding:18px;font-family:‘JetBrains Mono’,monospace;font-size:.82rem;color:#6ee7b7;line-height:2;text-align:center;margin:12px 0;}
.speak-btn{display:inline-flex;align-items:center;gap:7px;background:var(–blue);color:#fff;border:none;border-radius:10px;padding:9px 16px;font-family:‘Nunito’,sans-serif;font-weight:800;font-size:.87rem;cursor:pointer;box-shadow:0 3px 0 var(–blue-d);transition:all .2s;margin-bottom:14px;}
.speak-btn:hover{transform:translateY(-1px);}
.lm-footer{padding:16px 24px;border-top:2px solid var(–gray-l);display:flex;gap:10px;justify-content:flex-end;}
.btn-g{padding:12px 28px;border:none;border-radius:12px;font-family:‘Nunito’,sans-serif;font-weight:900;font-size:.97rem;cursor:pointer;transition:all .15s;}
.btn-g.green{background:var(–green);color:#fff;box-shadow:0 4px 0 var(–green-d);}
.btn-g.green:hover{transform:translateY(-2px);}
.btn-g.gray{background:var(–gray-l);color:var(–dark);}

/* ═══ EXERCICES ═══ */
.ex-wrap{max-width:780px;margin:0 auto;padding:24px 16px;}
.ex-hero{background:linear-gradient(135deg,var(–purple),var(–blue));border-radius:var(–radius);padding:24px;color:#fff;margin-bottom:20px;display:flex;align-items:center;gap:16px;}
.ex-hero .ico{font-size:3rem;}
.ex-hero h2{font-size:1.4rem;font-weight:900;margin-bottom:4px;}
.ex-hero p{opacity:.88;font-weight:600;font-size:.88rem;}
.ex-filters{display:flex;gap:8px;margin-bottom:16px;flex-wrap:wrap;}
.ef{padding:8px 18px;border:2.5px solid var(–gray-l);background:#fff;border-radius:20px;font-family:‘Nunito’,sans-serif;font-weight:800;font-size:.83rem;cursor:pointer;transition:all .2s;color:var(–gray);}
.ef:hover,.ef.on{border-color:var(–green);background:var(–green-l);color:var(–green-d);}
.exc{background:#fff;border-radius:var(–radius);padding:22px;box-shadow:var(–shadow) rgba(0,0,0,.08);margin-bottom:14px;border:2.5px solid transparent;transition:border-color .2s;}
.exc:hover{border-color:var(–blue-d);}
.ex-badge{display:inline-block;padding:3px 11px;border-radius:20px;font-size:.75rem;font-weight:900;margin-bottom:10px;}
.ex-badge.e{background:var(–green-l);color:var(–green-d);}
.ex-badge.h{background:var(–red-l);color:var(–red-d);}
.ex-badge.m{background:var(–yellow-l);color:var(–yellow-d);}
.ex-q{font-size:.97rem;font-weight:700;margin-bottom:12px;line-height:1.5;}
.sbtn{padding:9px 18px;background:var(–blue-l);border:2px solid var(–blue);border-radius:9px;font-family:‘Nunito’,sans-serif;font-weight:800;font-size:.85rem;cursor:pointer;color:var(–blue-d);transition:all .2s;}
.sbtn:hover{background:var(–blue);color:#fff;}
.sol{display:none;margin-top:12px;background:var(–green-l);border-radius:10px;padding:14px;border-left:4px solid var(–green);}
.sol.op{display:block;animation:fadeD .25s ease;}
@keyframes fadeD{from{opacity:0;transform:translateY(-8px);}to{opacity:1;transform:translateY(0);}}
.sol-lbl{font-size:.74rem;font-weight:900;text-transform:uppercase;color:var(–green-d);margin-bottom:6px;letter-spacing:.1em;}

/* ═══ GAME ═══ */
.game-wrap{max-width:700px;margin:0 auto;padding:24px 16px;}
.lvl-pick{display:grid;grid-template-columns:1fr 1fr;gap:12px;margin-bottom:24px;}
.lp{padding:18px;border:3px solid;border-radius:var(–radius);font-family:‘Nunito’,sans-serif;font-weight:900;font-size:.97rem;cursor:pointer;transition:all .22s;display:flex;flex-direction:column;align-items:center;gap:8px;background:#fff;}
.lp span{font-size:.8rem;font-weight:700;opacity:.7;}
.lp.e{border-color:var(–green);color:var(–green-d);}
.lp.h{border-color:var(–red);color:var(–red-d);}
.lp.e.on{background:var(–green);color:#fff;box-shadow:0 4px 0 var(–green-d);}
.lp.h.on{background:var(–red);color:#fff;box-shadow:0 4px 0 var(–red-d);}
.ghud{background:#fff;border-radius:var(–radius);padding:14px 18px;box-shadow:var(–shadow) rgba(0,0,0,.08);margin-bottom:14px;display:flex;align-items:center;gap:12px;}
.ghud-bar{flex:1;height:12px;background:var(–gray-l);border-radius:6px;overflow:hidden;}
.ghud-fill{height:100%;background:linear-gradient(90deg,var(–green),var(–blue));border-radius:6px;transition:width .4s ease;}
.ghud-hearts{font-size:1.2rem;letter-spacing:2px;}
.ghud-sc{font-weight:900;color:var(–yellow-d);}
.qbox{background:#fff;border-radius:var(–radius);padding:26px;box-shadow:var(–shadow) rgba(0,0,0,.08);animation:popIn .25s ease;}
@keyframes popIn{from{transform:scale(.9);opacity:0;}to{transform:scale(1);opacity:1;}}
.qtype{font-size:.75rem;font-weight:900;text-transform:uppercase;color:var(–gray);letter-spacing:.12em;margin-bottom:12px;}
.qq{font-size:1.1rem;font-weight:800;margin-bottom:20px;line-height:1.5;}
.opts{display:grid;grid-template-columns:1fr 1fr;gap:10px;margin-bottom:18px;}
.opt{padding:14px;border:3px solid var(–gray-l);border-radius:14px;background:#fff;font-family:‘Nunito’,sans-serif;font-weight:700;font-size:.92rem;cursor:pointer;transition:all .15s;text-align:left;line-height:1.4;}
.opt:hover{border-color:var(–blue);background:var(–blue-l);}
.opt.ok{border-color:var(–green)!important;background:var(–green-l)!important;color:var(–green-d)!important;}
.opt.no{border-color:var(–red)!important;background:var(–red-l)!important;color:var(–red-d)!important;}
.tf-row{display:flex;gap:12px;margin-bottom:18px;}
.tf{flex:1;padding:16px;border:3px solid var(–gray-l);border-radius:14px;background:#fff;font-family:‘Nunito’,sans-serif;font-weight:900;font-size:1rem;cursor:pointer;transition:all .15s;}
.tf:first-child:hover{border-color:var(–green);background:var(–green-l);}
.tf:last-child:hover{border-color:var(–red);background:var(–red-l);}
.fb{padding:14px 18px;border-radius:12px;font-weight:800;font-size:.92rem;margin-top:10px;display:none;align-items:center;gap:9px;}
.fb.ok{background:var(–green-l);color:var(–green-d);display:flex;}
.fb.no{background:var(–red-l);color:var(–red-d);display:flex;}
.nbtn{padding:13px 30px;background:var(–green);border:none;border-radius:12px;color:#fff;font-family:‘Nunito’,sans-serif;font-weight:900;font-size:.97rem;cursor:pointer;box-shadow:0 4px 0 var(–green-d);transition:all .15s;display:none;margin-top:12px;}
.nbtn:hover{transform:translateY(-2px);}
.end-card{background:#fff;border-radius:var(–radius);padding:36px 24px;text-align:center;box-shadow:var(–shadow) rgba(0,0,0,.08);display:none;animation:popIn .3s ease;}
.end-card.show{display:block;}
.end-card h2{font-size:2rem;font-weight:900;margin-bottom:8px;}
.end-stars{font-size:2.8rem;margin:16px 0;}
.end-score{font-size:3.5rem;font-weight:900;color:var(–green);}
.end-xp{font-size:1rem;color:var(–gray);font-weight:700;margin-bottom:20px;}
.rbtn{padding:14px 40px;background:var(–green);border:none;border-radius:14px;color:#fff;font-family:‘Nunito’,sans-serif;font-weight:900;font-size:1.05rem;cursor:pointer;box-shadow:0 4px 0 var(–green-d);}

/* ═══ LEADERBOARD ═══ */
.lb-wrap{max-width:680px;margin:0 auto;padding:24px 16px;}
.lb-hero{background:linear-gradient(135deg,var(–yellow),var(–orange));border-radius:var(–radius);padding:24px;text-align:center;color:#fff;margin-bottom:20px;}
.lb-hero h2{font-size:1.6rem;font-weight:900;margin-bottom:4px;}
.lb-hero p{opacity:.88;font-weight:700;}
.podium{display:flex;align-items:flex-end;justify-content:center;gap:12px;margin:20px 0;}
.pod{text-align:center;flex:1;}
.pod-av{font-size:2rem;margin-bottom:4px;}
.pod-name{font-weight:800;font-size:.85rem;margin-bottom:4px;}
.pod-xp{font-size:.8rem;font-weight:700;color:var(–gray);}
.pod-bar{border-radius:12px 12px 0 0;margin-top:8px;}
.pod.p1 .pod-bar{height:100px;background:linear-gradient(180deg,var(–yellow),var(–orange));box-shadow:0 4px 0 var(–orange-d);}
.pod.p2 .pod-bar{height:70px;background:linear-gradient(180deg,#c0c0c0,#999);}
.pod.p3 .pod-bar{height:50px;background:linear-gradient(180deg,#cd7f32,#a05a1e);}
.lb-table{background:#fff;border-radius:var(–radius);box-shadow:var(–shadow) rgba(0,0,0,.08);overflow:hidden;}
.lb-tr{display:flex;align-items:center;gap:12px;padding:14px 18px;border-bottom:1px solid var(–gray-l);transition:background .2s;}
.lb-tr:last-child{border:none;}
.lb-tr:hover{background:var(–gray-ll);}
.lb-tr.me{background:var(–blue-l);}
.lb-rk{font-weight:900;width:24px;font-size:.9rem;}
.lb-emoji{font-size:1.5rem;}
.lb-nm{flex:1;font-weight:700;}
.lb-pts{font-weight:900;color:var(–yellow-d);}
.lb-badge2{font-size:1.1rem;}

/* ═══ PROFILE ═══ */
.prof-wrap{max-width:700px;margin:0 auto;padding:24px 16px;}
.prof-hero{background:linear-gradient(135deg,var(–purple),var(–blue));border-radius:20px;padding:28px;text-align:center;color:#fff;margin-bottom:20px;position:relative;overflow:hidden;}
.prof-hero::before{content:‘⭐’;position:absolute;font-size:80px;opacity:.1;right:10px;top:10px;}
.pav{font-size:5rem;margin-bottom:8px;}
.pname{font-size:1.7rem;font-weight:900;}
.plvl{background:rgba(255,255,255,.25);border-radius:20px;display:inline-block;padding:5px 16px;margin-top:8px;font-weight:800;font-size:.88rem;}
.stats3{display:grid;grid-template-columns:repeat(3,1fr);gap:12px;margin-bottom:20px;}
.sc{background:#fff;border-radius:14px;padding:18px;text-align:center;box-shadow:var(–shadow) rgba(0,0,0,.08);}
.sn{font-size:1.8rem;font-weight:900;margin-bottom:4px;}
.sl{font-size:.75rem;font-weight:800;color:var(–gray);text-transform:uppercase;letter-spacing:.08em;}
.bg-grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(75px,1fr));gap:10px;}
.bg-item{text-align:center;padding:10px 6px;border-radius:12px;background:var(–gray-l);transition:all .2s;}
.bg-item.earn{background:var(–yellow-l);transform:scale(1.04);}
.bg-ico{font-size:1.8rem;margin-bottom:4px;}
.bg-nm{font-size:.67rem;font-weight:800;color:var(–gray);}
.bg-item.earn .bg-nm{color:var(–yellow-d);}

/* ═══ AI CHAT ═══ */
.ai-wrap{max-width:780px;margin:0 auto;padding:24px 16px;}
.ai-hero{background:linear-gradient(135deg,#1a1a2e,#16213e,#0f3460);border-radius:var(–radius);padding:24px;color:#fff;margin-bottom:20px;display:flex;align-items:center;gap:16px;}
.ai-hero .ico{font-size:3rem;animation:robo 2s ease-in-out infinite alternate;}
@keyframes robo{from{transform:translateY(0);}to{transform:translateY(-8px);}}
.ai-hero h2{font-size:1.4rem;font-weight:900;margin-bottom:4px;}
.ai-hero p{opacity:.75;font-size:.87rem;font-weight:600;}
.chat-box{background:#fff;border-radius:var(–radius);box-shadow:var(–shadow) rgba(0,0,0,.08);overflow:hidden;display:flex;flex-direction:column;height:520px;}
.chat-msgs{flex:1;overflow-y:auto;padding:20px;display:flex;flex-direction:column;gap:12px;}
.msg{max-width:78%;padding:12px 16px;border-radius:16px;font-size:.92rem;line-height:1.6;font-weight:600;animation:msgIn .2s ease;}
@keyframes msgIn{from{opacity:0;transform:translateY(6px);}to{opacity:1;transform:translateY(0);}}
.msg.bot{background:var(–gray-ll);border:1px solid var(–gray-l);border-bottom-left-radius:4px;align-self:flex-start;}
.msg.bot strong{color:var(–blue-d);}
.msg.usr{background:var(–blue);color:#fff;border-bottom-right-radius:4px;align-self:flex-end;}
.msg.typing{background:var(–gray-ll);border:1px solid var(–gray-l);align-self:flex-start;padding:14px 18px;}
.dot-anim{display:flex;gap:5px;}
.dot-anim span{width:8px;height:8px;border-radius:50%;background:var(–gray);animation:dotBounce 1.2s ease-in-out infinite;}
.dot-anim span:nth-child(2){animation-delay:.2s;}
.dot-anim span:nth-child(3){animation-delay:.4s;}
@keyframes dotBounce{0%,100%{transform:translateY(0);}50%{transform:translateY(-6px);}}
.chat-input{border-top:2px solid var(–gray-l);padding:12px 16px;display:flex;gap:10px;align-items:center;}
.chat-input input{flex:1;border:2px solid var(–gray-l);border-radius:24px;padding:11px 18px;font-family:‘Nunito’,sans-serif;font-size:.95rem;font-weight:600;outline:none;transition:border-color .2s;}
.chat-input input:focus{border-color:var(–blue);}
.send-btn{width:44px;height:44px;border-radius:50%;background:var(–blue);border:none;color:#fff;font-size:1.1rem;cursor:pointer;display:flex;align-items:center;justify-content:center;box-shadow:0 3px 0 var(–blue-d);transition:all .15s;}
.send-btn:hover{transform:translateY(-1px);}
.chip-row{display:flex;gap:8px;flex-wrap:wrap;padding:8px 16px;border-top:1px solid var(–gray-l);}
.chip{padding:6px 14px;background:var(–blue-l);border:1.5px solid var(–blue);border-radius:20px;font-size:.78rem;font-weight:800;color:var(–blue-d);cursor:pointer;white-space:nowrap;transition:all .18s;}
.chip:hover{background:var(–blue);color:#fff;}

/* ═══ ADMIN ═══ */
.adm-wrap{max-width:820px;margin:0 auto;padding:24px 16px;}
.adm-card{background:#fff;border-radius:var(–radius);padding:26px;box-shadow:var(–shadow) rgba(0,0,0,.08);margin-bottom:18px;}
.adm-card h3{font-size:1.1rem;font-weight:900;margin-bottom:16px;display:flex;align-items:center;gap:9px;}
.fr{margin-bottom:14px;}
.fr label{display:block;font-weight:800;font-size:.82rem;margin-bottom:5px;}
.fr input,.fr select,.fr textarea{width:100%;padding:11px 14px;border:2px solid var(–gray-l);border-radius:9px;font-family:‘Nunito’,sans-serif;font-size:.93rem;font-weight:600;outline:none;transition:border-color .2s;resize:vertical;}
.fr input:focus,.fr select:focus,.fr textarea:focus{border-color:var(–blue);}
.fr textarea{min-height:110px;}
.btn-add{padding:11px 22px;background:var(–purple);border:none;border-radius:9px;color:#fff;font-family:‘Nunito’,sans-serif;font-weight:900;font-size:.92rem;cursor:pointer;box-shadow:0 3px 0 var(–purple-d);}
.exist-list{display:flex;flex-direction:column;gap:9px;margin-top:14px;}
.ei{background:var(–gray-ll);border-radius:9px;padding:12px 16px;display:flex;align-items:center;justify-content:space-between;}
.ei span{font-weight:700;}
.del-btn{background:var(–red);color:#fff;border:none;border-radius:8px;padding:5px 12px;cursor:pointer;font-family:‘Nunito’,sans-serif;font-weight:800;font-size:.8rem;}

/* ═══ FLOATS & UTILS ═══ */
.float-voice{position:fixed;bottom:24px;right:24px;width:54px;height:54px;border-radius:50%;background:var(–blue);border:none;color:#fff;font-size:1.4rem;cursor:pointer;box-shadow:0 4px 16px rgba(28,176,246,.4);z-index:800;transition:all .2s;}
.float-voice:hover{transform:scale(1.1);}
.float-voice.on{background:var(–red);animation:pulseRed 1s ease-in-out infinite;}
@keyframes pulseRed{0%,100%{box-shadow:0 0 0 0 rgba(255,75,75,.4);}50%{box-shadow:0 0 0 16px rgba(255,75,75,0);}}
.toast{position:fixed;bottom:88px;left:50%;transform:translateX(-50%) translateY(12px);background:var(–dark);color:#fff;padding:11px 22px;border-radius:24px;font-weight:700;font-size:.88rem;opacity:0;transition:all .3s;pointer-events:none;z-index:9000;white-space:nowrap;}
.toast.on{opacity:1;transform:translateX(-50%) translateY(0);}
.xp-fly{position:fixed;pointer-events:none;font-weight:900;font-size:1.1rem;color:var(–yellow-d);z-index:9999;animation:flyUp 1.2s ease forwards;}
@keyframes flyUp{0%{opacity:1;transform:translateY(0);}100%{opacity:0;transform:translateY(-55px);}}
.combo-flash{position:fixed;top:50%;left:50%;transform:translate(-50%,-50%);font-size:3rem;font-weight:900;color:var(–orange);z-index:9998;pointer-events:none;animation:comboAnim .8s ease forwards;}
@keyframes comboAnim{0%{opacity:1;transform:translate(-50%,-50%) scale(.5);}50%{opacity:1;transform:translate(-50%,-50%) scale(1.2);}100%{opacity:0;transform:translate(-50%,-50%) scale(1);}}
@media(max-width:580px){
.top-nav .tn span:not(.ni){display:none;}
.opts,.vg{grid-template-columns:1fr;}
.stats3{grid-template-columns:1fr 1fr;}
.lvl-pick{grid-template-columns:1fr;}
}
</style>

</head>
<body>

<!-- SPLASH -->

<div id="splash">
  <div class="sp-owl">🦉</div>
  <h1>ArbrLearn</h1>
  <p>Apprends l'informatique en jouant !</p>
  <div class="sp-dots"><div class="sp-dot"></div><div class="sp-dot"></div><div class="sp-dot"></div></div>
</div>

<!-- AUTH -->

<div id="authWrap">
  <div class="auth-card">
    <div class="auth-top">
      <span class="owl">🦉</span>
      <h2>ArbrLearn</h2>
      <p>Apprends l'informatique en t'amusant !</p>
    </div>
    <div class="auth-body">
      <div class="tabs">
        <button class="tab on" onclick="switchTab('login')">Connexion</button>
        <button class="tab" onclick="switchTab('reg')">S'inscrire</button>
      </div>
      <div id="fLogin">
        <div class="fld"><label>Nom d'utilisateur</label><input id="lu" placeholder="Ton pseudo"></div>
        <div class="fld"><label>Mot de passe</label><input id="lp" type="password" placeholder="••••••••"></div>
        <button class="btn-main" onclick="doLogin()">Se connecter 🚀</button>
      </div>
      <div id="fReg" style="display:none">
        <div class="fld"><label>Nom d'utilisateur</label><input id="ru" placeholder="Choisis un pseudo"></div>
        <div class="fld"><label>Mot de passe</label><input id="rp" type="password" placeholder="••••••••"></div>
        <div class="fld"><label>Ton avatar</label></div>
        <div class="avs" id="avPick">
          <div class="av on" data-v="🦊">🦊</div><div class="av" data-v="🐼">🐼</div>
          <div class="av" data-v="🦁">🦁</div><div class="av" data-v="🐸">🐸</div>
          <div class="av" data-v="🦋">🦋</div><div class="av" data-v="🐙">🐙</div>
          <div class="av" data-v="🦄">🦄</div><div class="av" data-v="🐉">🐉</div>
        </div>
        <button class="btn-main" onclick="doRegister()">Créer mon profil 🎉</button>
      </div>
    </div>
  </div>
</div>

<!-- APP -->

<div id="app">
  <nav class="topbar">
    <div class="logo" onclick="nav('home')"><span>🦉</span>ArbrLearn</div>
    <div class="top-nav">
      <button class="tn on" id="tn-home" onclick="nav('home')"><span class="ni">🏠</span><span>Accueil</span></button>
      <button class="tn" id="tn-cours" onclick="nav('cours')"><span class="ni">📚</span><span>Cours</span></button>
      <button class="tn" id="tn-ex" onclick="nav('ex')"><span class="ni">✏️</span><span>Exercices</span></button>
      <button class="tn" id="tn-game" onclick="nav('game')"><span class="ni">🎮</span><span>Jeu</span></button>
      <button class="tn" id="tn-lb" onclick="nav('lb')"><span class="ni">🏆</span><span>Classement</span></button>
      <button class="tn" id="tn-ai" onclick="nav('ai')"><span class="ni">🤖</span><span>IA</span></button>
      <button class="tn" id="tn-prof" onclick="nav('prof')"><span class="ni">👤</span><span>Profil</span></button>
      <button class="tn" id="tn-adm" onclick="nav('adm')" style="display:none"><span class="ni">⚙️</span><span>Admin</span></button>
    </div>
    <div class="top-r">
      <div class="pill str">🔥 <span id="strkN">1</span></div>
      <div class="pill xp">⭐ <span id="xpN">0</span></div>
      <div class="pill gem">💎 <span id="gemN">5</span></div>
      <div class="uav" id="uav" onclick="nav('prof')">🦊</div>
    </div>
  </nav>

  <!-- HOME -->

  <div class="pg on" id="pg-home">
    <div class="hero">
      <h1>Bonjour <span id="hName">!</span> 👋</h1>
      <p>Continue ta progression aujourd'hui !</p>
    </div>
    <div class="home-body">
      <div class="daily-box">
        <div class="daily-icon">🎯</div>
        <div class="daily-info">
          <h3>Objectif du jour</h3>
          <div class="daily-bar"><div class="daily-fill" id="dailyFill" style="width:0%"></div></div>
          <div class="daily-txt" id="dailyTxt">0/50 XP aujourd'hui</div>
        </div>
      </div>
      <p class="sec-lbl">📚 Mes cours</p>
      <div class="courses-grid" id="cGrid"></div>
      <p class="sec-lbl">🏆 Top apprenants</p>
      <div class="lb-mini">
        <h3>🏅 Classement de la semaine</h3>
        <div id="lbMini"></div>
      </div>
    </div>
  </div>

  <!-- COURS -->

  <div class="pg" id="pg-cours">
    <div class="cours-wrap">
      <div class="path-header">
        <div class="path-icon">🌳</div>
        <div class="path-info">
          <h2 id="pathTitle">Les Arbres</h2>
          <p id="pathDesc">Structures de données — 7 leçons</p>
        </div>
      </div>
      <div id="skillTree"></div>
    </div>
  </div>

  <!-- LESSON MODAL -->

  <div class="lesson-modal" id="lessonModal">
    <div class="lm-box">
      <div class="lm-head">
        <div>
          <div style="font-size:.75rem;font-weight:800;color:var(--gray);text-transform:uppercase;letter-spacing:.1em" id="lmCourse">LES ARBRES</div>
          <div style="font-size:1.1rem;font-weight:900;margin-top:2px" id="lmTitle">Définition</div>
        </div>
        <button class="lm-close" onclick="closeLesson()">✕</button>
      </div>
      <div class="lm-body" id="lmBody"></div>
      <div class="lm-footer">
        <button class="btn-g gray" onclick="closeLesson()">Fermer</button>
        <button class="btn-g green" id="lmStart" onclick="startLessonGame()">🎮 S'entraîner (+10 XP)</button>
      </div>
    </div>
  </div>

  <!-- EXERCICES -->

  <div class="pg" id="pg-ex">
    <div class="ex-wrap">
      <div class="ex-hero">
        <div class="ico">✏️</div>
        <div><h2>Exercices</h2><p>Révèle les solutions quand tu es prêt !</p></div>
      </div>
      <div class="ex-filters">
        <button class="ef on" onclick="filterEx('all',this)">Tous</button>
        <button class="ef" onclick="filterEx('e',this)">🟢 Facile</button>
        <button class="ef" onclick="filterEx('m',this)">🟡 Moyen</button>
        <button class="ef" onclick="filterEx('h',this)">🔴 Difficile</button>
        <button class="ef" onclick="filterEx('bdd',this)">🗄️ Bases de données</button>
        <button class="ef" onclick="filterEx('arb',this)">🌳 Arbres</button>
      </div>
      <div id="exList"></div>
    </div>
  </div>

  <!-- GAME -->

  <div class="pg" id="pg-game">
    <div class="game-wrap">
      <p class="sec-lbl" style="margin-bottom:12px">🎮 Quiz — Teste tes connaissances !</p>
      <div class="lvl-pick">
        <button class="lp e on" onclick="setLvl('e')">🟢 Facile<span>Débutant — Questions de base</span></button>
        <button class="lp h" onclick="setLvl('h')">🔴 Difficile<span>Expert — Questions avancées</span></button>
      </div>
      <div id="gameArea"></div>
      <div class="end-card" id="endCard">
        <div style="font-size:4rem">🏆</div>
        <h2>Partie terminée !</h2>
        <div class="end-stars" id="endStars">⭐⭐⭐</div>
        <div class="end-score" id="endScore">0</div>
        <div class="end-xp" id="endXp">Tu as gagné 0 XP !</div>
        <button class="rbtn" onclick="startGame()">🔄 Rejouer</button>
      </div>
    </div>
  </div>

  <!-- LEADERBOARD -->

  <div class="pg" id="pg-lb">
    <div class="lb-wrap">
      <div class="lb-hero">
        <h2>🏆 Classement Mondial</h2>
        <p>Qui est le meilleur apprenant cette semaine ?</p>
      </div>
      <div class="podium" id="podium"></div>
      <div class="lb-table" id="lbTable"></div>
    </div>
  </div>

  <!-- AI -->

  <div class="pg" id="pg-ai">
    <div class="ai-wrap">
      <div class="ai-hero">
        <div class="ico">🤖</div>
        <div>
          <h2>Assistant IA Informatique</h2>
          <p>Pose-moi n'importe quelle question sur l'informatique — je suis là pour t'aider !</p>
        </div>
      </div>
      <div class="chat-box">
        <div class="chat-msgs" id="chatMsgs"></div>
        <div class="chip-row" id="chipRow"></div>
        <div class="chat-input">
          <input id="chatIn" placeholder="Pose ta question..." onkeydown="if(event.key==='Enter')sendChat()">
          <button class="send-btn" onclick="sendChat()">➤</button>
        </div>
      </div>
    </div>
  </div>

  <!-- PROFILE -->

  <div class="pg" id="pg-prof">
    <div class="prof-wrap">
      <div class="prof-hero">
        <div class="pav" id="pAv">🦊</div>
        <div class="pname" id="pName">Apprenant</div>
        <div class="plvl" id="pLvl">Niveau 1 — Graine 🌱</div>
      </div>
      <div class="stats3">
        <div class="sc"><div class="sn" id="sXP" style="color:var(--green)">0</div><div class="sl">XP Total</div></div>
        <div class="sc"><div class="sn" id="sStr" style="color:var(--orange)">1</div><div class="sl">Jours de suite</div></div>
        <div class="sc"><div class="sn" id="sG" style="color:var(--blue)">0</div><div class="sl">Jeux joués</div></div>
      </div>
      <div class="adm-card" style="margin-bottom:0">
        <h3 style="font-weight:900;font-size:1rem;margin-bottom:14px">🏅 Badges</h3>
        <div class="bg-grid" id="bgGrid"></div>
      </div>
    </div>
  </div>

  <!-- ADMIN -->

  <div class="pg" id="pg-adm">
    <div class="adm-wrap">
      <p class="sec-lbl" style="margin-bottom:12px">⚙️ Administration</p>
      <div class="adm-card">
        <h3>➕ Ajouter un cours</h3>
        <div class="fr"><label>Icône</label><input id="aIcon" placeholder="🌳" maxlength="4"></div>
        <div class="fr"><label>Titre</label><input id="aTitle" placeholder="Ex: Les Graphes"></div>
        <div class="fr"><label>Description</label><input id="aDesc" placeholder="Courte description..."></div>
        <div class="fr"><label>Contenu (sépare les chapitres par ###)</label>
          <textarea id="aCont" placeholder="### Définition&#10;Un graphe est...&#10;### Types&#10;..."></textarea>
        </div>
        <div class="fr"><label>Niveau</label>
          <select id="aLvl"><option value="débutant">Débutant</option><option value="intermédiaire">Intermédiaire</option><option value="avancé">Avancé</option></select>
        </div>
        <button class="btn-add" onclick="addCourse()">✅ Ajouter</button>
      </div>
      <div class="adm-card">
        <h3>📋 Cours existants</h3>
        <div class="exist-list" id="existList"></div>
      </div>
    </div>
  </div>
</div>

<button class="float-voice" id="voiceBtn" onclick="toggleVoice()" title="Lecture vocale">🔊</button>

<div class="toast" id="toast"></div>

<script>
// ══════════════════════════════════════════════════════
// COURSES DATA
// ══════════════════════════════════════════════════════
const COURSES_DATA = [
  {
    id:'arbres', icon:'🌳', title:'Les Arbres', level:'intermédiaire', locked:false,
    desc:'Structures arborescentes, terminologie, parcours, ABR et tri par tas.',
    lessons:[
      {id:'a1',icon:'🌱',title:'Définition & Structure',done:false,
       content:`<p>Un <strong>arbre</strong> est un ensemble organisé de nœuds dans lequel chaque nœud a un père et un seul, sauf un nœud appelé la <strong>racine</strong>.</p>
<p>Les arbres sont des structures <strong>non linéaires</strong>, contrairement aux listes, piles et files.</p>
<div class="hbox">📌 Définition officielle : Un arbre = ensemble de nœuds reliés par des arêtes, avec exactement un chemin entre deux nœuds.</div>
<div class="vg">
<div class="vc"><div class="vt">🌳 Racine</div><div class="vd">Le seul nœud sans père</div></div>
<div class="vc"><div class="vt">🍃 Feuille</div><div class="vd">Nœud sans enfants</div></div>
<div class="vc"><div class="vt">👥 Frère</div><div class="vd">Même parent</div></div>
<div class="vc"><div class="vt">👴 Ancêtre</div><div class="vd">Parent d'un parent...</div></div>
</div>
<div class="tree-viz">         🌳 Racine (r)
        /        \\
      (a)         (y)
      /          /   \\
     (b)        (h)  (x)
  [feuille]  [feuille] [feuille]</div>
<div class="tipbox">💡 Pense à ton arbre généalogique ! La racine = arrière-grand-père, les feuilles = les bébés.</div>`,
       vocab:['racine','feuille','frère','ancêtre','degré']},
      {id:'a2',icon:'🎯',title:'Applications',done:false,
       content:`<p>Les arbres sont utilisés <strong>partout</strong> en informatique !</p>
<div class="vg">
<div class="vc"><div class="vt">👨‍👩‍👧 Généalogiques</div><div class="vd">Représenter des familles</div></div>
<div class="vc"><div class="vt">🧮 Expressions</div><div class="vd">Calcul arithmétique</div></div>
<div class="vc"><div class="vt">🤖 IA</div><div class="vd">Arbres de décision</div></div>
<div class="vc"><div class="vt">💾 Fichiers</div><div class="vd">FAT, EXT, HDFS...</div></div>
</div>
<div class="tree-viz">      [+]
     /    \\
   [*]    [-]
   / \\    / \\
  [4][3] [*]  [5]
         / \\
        [2] [7]
  → Expression: 4×3 + 2×7 − 5</div>
<div class="tipbox">💡 L'expression 4*3 + 2*7 - 5 devient un arbre ! La racine est l'opération finale.</div>`,
       vocab:[]},
      {id:'a3',icon:'📏',title:'Terminologie',done:false,
       content:`<p><strong>Degré</strong> d'un nœud = Nombre de ses enfants directs</p>
<p><strong>Profondeur</strong> = Longueur du chemin depuis la racine (racine = profondeur 0 ou 1)</p>
<p><strong>Hauteur</strong> de l'arbre = Profondeur maximale</p>
<p><strong>Hauteur</strong> d'un nœud = Distance max vers une feuille</p>
<div class="tree-viz">Profondeur 0:      (r) ← racine, degré=2
              /       \\
Profondeur 1: (a)       (y)   ← degré a=1, y=2
              /         / \\
Profondeur 2:(b)       (h) (x) ← feuilles, degré=0
        → Hauteur de l'arbre = 2</div>`,
       vocab:['degré','profondeur','hauteur']},
      {id:'a4',icon:'🐍',title:'Implémentation Python',done:false,
       content:`<p>En Python, on représente un arbre binaire avec une <strong>liste de 3 éléments</strong> : <code>[valeur, fils_gauche, fils_droit]</code></p>
<p>Un arbre <strong>vide</strong> = <code>None</code></p>
<div class="cb">Arb = [15,
       [7, [6, None, None], [9, None, None]],
       [20, None, [25, None, None]]
      ]

def est_vide(Arb):   return Arb == None
def valeur(Arb):     return Arb[0]
def fils_gauche(Arb):return Arb[1]
def fils_droit(Arb): return Arb[2]
def est_feuille(Arb):return Arb[1]==None and Arb[2]==None</div>
<div class="tipbox">💡 Arb[0]=valeur, Arb[1]=gauche, Arb[2]=droite. Simple !</div>`,
       vocab:[]},
      {id:'a5',icon:'🔄',title:'Parcours d\'arbres',done:false,
       content:`<p>4 types de parcours :</p>
<div class="vg">
<div class="vc"><div class="vt">📍 Préfixe</div><div class="vd">Racine → Gauche → Droite</div></div>
<div class="vc"><div class="vt">📍 Infixe</div><div class="vd">Gauche → Racine → Droite</div></div>
<div class="vc"><div class="vt">📍 Suffixe</div><div class="vd">Gauche → Droite → Racine</div></div>
<div class="vc"><div class="vt">📍 Largeur</div><div class="vd">Niveau par niveau (BFS)</div></div>
</div>
<div class="cb">def prefixe(Arb):
    if Arb != None:
        print(Arb[0])       # Racine
        prefixe(Arb[1])     # Gauche
        prefixe(Arb[2])     # Droite

def infixe(Arb):
    if Arb != None:
        infixe(Arb[1])
        print(Arb[0])
        infixe(Arb[2])

def largeur(Arb):
    file = [Arb]
    while file:
        N = file.pop(0)
        print(N[0])
        if N[1]: file.append(N[1])
        if N[2]: file.append(N[2])</div>
<div class="tipbox">💡 Pré = avant (racine d'abord) | In = dedans (racine au milieu) | Suf = après (racine en dernier)</div>`,
       vocab:['préfixe','infixe','suffixe','parcours en largeur']},
      {id:'a6',icon:'🔍',title:'Arbre Binaire de Recherche',done:false,
       content:`<p>Un <strong>ABR</strong> : tous les nœuds gauche ≤ racine < tous les nœuds droite</p>
<p>Permet une recherche ultra rapide (O(log n)) !</p>
<div class="tree-viz">        24
       /  \\
      8    29
     / \\   / \\
    1  16  27  35
       /\\
      15 20  ← ABR valide !</div>
<div class="cb">def rechDic(x, Abr):
    if Abr == None: return False   # Absent
    if x == Abr[0]: return True    # Trouvé!
    if x < Abr[0]: return rechDic(x, Abr[1])
    return rechDic(x, Abr[2])

def inserer(arb, v):
    if arb == None: return [v,None,None]
    if v <= arb[0]: arb[1] = inserer(arb[1],v)
    else: arb[2] = inserer(arb[2],v)
    return arb</div>`,
       vocab:['ABR','dichotomie','insertion','suppression']},
      {id:'a7',icon:'📊',title:'Tri par Tas',done:false,
       content:`<p>Le <strong>tri par tas</strong> utilise un arbre parfait representé par une liste.</p>
<p>Règle : L[2i+1]=fils gauche, L[2i+2]=fils droit de L[i]</p>
<div class="cb">def gauche(i): return 2*i + 1
def droite(i): return 2*i + 2

def entasser(L, noeud, limite):
    i = noeud
    while i < limite:
        imax = i
        if gauche(i)<limite and L[gauche(i)]>L[imax]:
            imax = gauche(i)
        if droite(i)<limite and L[droite(i)]>L[imax]:
            imax = droite(i)
        if i != imax:
            L[i], L[imax] = L[imax], L[i]; i=imax
        else: break

def tri_tas(L):
    for i in range(len(L)//2-1,-1,-1):
        entasser(L,i,len(L))
    for i in range(len(L)-1,0,-1):
        L[0],L[i]=L[i],L[0]; entasser(L,0,i)</div>`,
       vocab:['tas','heap','entasser','tri maximier']},
    ]
  },
  {
    id:'bdd', icon:'🗄️', title:'Bases de données', level:'débutant', locked:false,
    desc:'Généralités sur les BD, SGBD, architecture ANSI/SPARC et types d\'utilisateurs.',
    lessons:[
      {id:'b1',icon:'📦',title:'Qu\'est-ce qu\'une BD ?',done:false,
       content:`<p>Une <strong>base de données (BD)</strong> est un recueil d'informations liées à un sujet donné, stockées de façon structurée avec le moins de redondance possible.</p>
<div class="vg">
<div class="vc"><div class="vt">🏪 BD locale</div><div class="vd">Une seule machine, un utilisateur</div></div>
<div class="vc"><div class="vt">🌐 BD répartie</div><div class="vd">Machines distantes, réseau</div></div>
</div>
<div class="hbox">📌 Exemples : Stock d'un magasin, réservations d'agence de voyages, service de scolarité (notes étudiants)...</div>
<p>Un <strong>Système d'Information (SI)</strong> est un ensemble organisé de ressources (matériels, logiciels, personnel, données) permettant de traiter et diffuser de l'information.</p>`,
       vocab:['BD','SI','redondance','champ']},
      {id:'b2',icon:'⚙️',title:'SGBD — Définition',done:false,
       content:`<p>Un <strong>SGBD</strong> (Système de Gestion de Bases de Données) est un logiciel qui facilite la consultation et la mise à jour d'une BD.</p>
<div class="hbox">Exemples : dBase4, FoxPro, Access, Oracle, Sybase, MySQL, PostgreSQL...</div>
<p>Fonctionnalités d'un SGBD :</p>
<div class="vg">
<div class="vc"><div class="vt">🔓 Accès simple</div><div class="vd">Permettre l'accès aux données facilement</div></div>
<div class="vc"><div class="vt">👥 Multi-utilisateurs</div><div class="vd">Plusieurs accès simultanés</div></div>
<div class="vc"><div class="vt">✏️ Manipulation</div><div class="vd">Insertion, suppression, modification</div></div>
<div class="vc"><div class="vt">🛡️ Sécurité</div><div class="vd">Droits d'accès par utilisateur</div></div>
</div>
<p>Un SGBD se décompose en 3 sous-systèmes :</p>
<p>• <strong>Gestion de fichiers</strong> : stockage physique<br>• <strong>SGBD interne</strong> : ordonnancement<br>• <strong>SGBD externe</strong> : interface utilisateur</p>`,
       vocab:['SGBD','SGBDR','SGBDO','MySQL','Oracle']},
      {id:'b3',icon:'🏗️',title:'Architecture ANSI/SPARC',done:false,
       content:`<p>Proposée en <strong>1965 par Charles Bachman</strong> (Prix Turing). C'est l'architecture fondamentale des SGBD modernes.</p>
<p>Divisée en <strong>3 niveaux</strong> :</p>
<div class="vg">
<div class="vc"><div class="vt">🔵 SE — Schéma Externe</div><div class="vd">Vue de l'utilisateur (portion de la BD)</div></div>
<div class="vc"><div class="vt">🟡 SC — Schéma Conceptuel</div><div class="vd">Structure logique globale</div></div>
<div class="vc"><div class="vt">🟢 SI — Schéma Interne</div><div class="vd">Implémentation physique</div></div>
<div class="vc"><div class="vt">💡 Vue</div><div class="vd">Ancien terme : "schéma externe"</div></div>
</div>
<div class="tree-viz">  SE1  SE2  SE3  ← Vues utilisateurs
      \\   |   /
       \\ |  /
        [SC]  ← Structure logique
         |
        [SI]  ← Fichiers physiques
         |
      [Disque]</div>
<div class="tipbox">💡 Avantage : modifier le physique sans toucher au logique, et vice-versa !</div>`,
       vocab:['ANSI/SPARC','schéma externe','schéma conceptuel','schéma interne','vue']},
      {id:'b4',icon:'✅',title:'Caractéristiques d\'un SGBD',done:false,
       content:`<p>Les SGBD doivent respecter plusieurs propriétés fondamentales :</p>
<div class="vg">
<div class="vc"><div class="vt">🔒 Indépendance physique</div><div class="vd">Modifier physique sans toucher logique</div></div>
<div class="vc"><div class="vt">🔓 Indépendance logique</div><div class="vd">Modifier logique sans bloquer les utilisateurs</div></div>
<div class="vc"><div class="vt">🎯 Non-redondance</div><div class="vd">Chaque donnée stockée une seule fois</div></div>
<div class="vc"><div class="vt">👥 Partageabilité</div><div class="vd">Accès simultané à plusieurs utilisateurs</div></div>
<div class="vc"><div class="vt">🛡️ Sécurité</div><div class="vd">Droits d'accès par utilisateur</div></div>
<div class="vc"><div class="vt">⚡ Efficacité</div><div class="vd">Réponses rapides aux requêtes</div></div>
<div class="vc"><div class="vt">✅ Cohérence</div><div class="vd">Contraintes d'intégrité vérifiées</div></div>
<div class="vc"><div class="vt">🔋 Résistance pannes</div><div class="vd">Récupération d'un état sain</div></div>
</div>`,
       vocab:['intégrité','redondance','indépendance','sécurité']},
      {id:'b5',icon:'🗂️',title:'Types de SGBD',done:false,
       content:`<p>Il existe <strong>5 types principaux</strong> de SGBD :</p>
<div class="vg">
<div class="vc"><div class="vt">🌳 Hiérarchique</div><div class="vd">Données en arbre + pointeurs</div></div>
<div class="vc"><div class="vt">🕸️ Réseau</div><div class="vd">Données en graphe quelconque</div></div>
<div class="vc"><div class="vt">📊 Relationnel (SGBDR)</div><div class="vd">Tables lignes/colonnes + SQL</div></div>
<div class="vc"><div class="vt">🧠 Déductif</div><div class="vd">Tables + langage logique</div></div>
<div class="vc"><div class="vt">🧩 Objet (SGBDO)</div><div class="vd">Données en classes/objets</div></div>
</div>
<div class="hbox">📌 Le plus courant aujourd'hui : SGBDR (MySQL, PostgreSQL, Oracle, Access). Les données sont dans des tables !</div>`,
       vocab:['SGBDR','SGBDO','SQL','algèbre relationnelle']},
      {id:'b6',icon:'👤',title:'Types d\'utilisateurs',done:false,
       content:`<p>Une BD a <strong>3 types d'utilisateurs</strong> :</p>
<div class="vg">
<div class="vc"><div class="vt">👑 Administrateur</div><div class="vd">Contrôle la BD, gère les droits, sauvegardes et reprise après pannes</div></div>
<div class="vc"><div class="vt">💻 Programmeur</div><div class="vd">Écrit des applications, crée tables, vues et index</div></div>
<div class="vc"><div class="vt">🙋 Utilisateur final</div><div class="vd">Accède uniquement aux données autorisées via applications ou requêtes</div></div>
</div>
<div class="tipbox">💡 L'administrateur = le "chef" de la BD. Il décide qui a accès à quoi !</div>`,
       vocab:['administrateur','programmeur','utilisateur final','droits d\'accès']},
    ]
  }
];

// ══════════════════════════════════════════════════════
// QUESTIONS
// ══════════════════════════════════════════════════════
const QS = {
  e:[
    {t:'tf',q:'La racine est le seul nœud sans père dans un arbre.',a:true,topic:'arb'},
    {t:'tf',q:'Une feuille est un nœud qui n\'a aucun enfant.',a:true,topic:'arb'},
    {t:'tf',q:'La hauteur d\'un arbre est le nombre total de nœuds.',a:false,topic:'arb'},
    {t:'tf',q:'Un arbre vide se représente par None en Python.',a:true,topic:'arb'},
    {t:'tf',q:'Une BD peut être accédée par plusieurs utilisateurs simultanément.',a:true,topic:'bdd'},
    {t:'tf',q:'Un SGBD est un logiciel de traitement de texte.',a:false,topic:'bdd'},
    {t:'tf',q:'MySQL est un exemple de SGBD.',a:true,topic:'bdd'},
    {t:'tf',q:'Dans une BD, les données doivent être redondantes.',a:false,topic:'bdd'},
    {t:'qcm',q:'La structure d\'un nœud en Python est :',opts:['[val,gauche,droite]','(val,gauche,droite)','{val:gauche}','val->gauche->droite'],a:0,topic:'arb'},
    {t:'qcm',q:'Le parcours en LARGEUR explore l\'arbre :',opts:['Branche par branche','Niveau par niveau','De droite à gauche','Aléatoirement'],a:1,topic:'arb'},
    {t:'qcm',q:'BD signifie :',opts:['Binary Data','Base de Données','Big Data','Base Digitale'],a:1,topic:'bdd'},
    {t:'qcm',q:'Qui contrôle les droits d\'accès à une BD ?',opts:['L\'utilisateur final','Le programmeur','L\'administrateur','Le serveur'],a:2,topic:'bdd'},
    {t:'qcm',q:'L\'architecture ANSI/SPARC a combien de niveaux ?',opts:['2','3','4','5'],a:1,topic:'bdd'},
    {t:'qcm',q:'Dans le parcours PRÉFIXE, on visite d\'abord :',opts:['Les feuilles','Le fils gauche','Le fils droit','La racine'],a:3,topic:'arb'},
  ],
  h:[
    {t:'tf',q:'Dans un ABR, tous les nœuds gauche ont des valeurs ≤ à la racine.',a:true,topic:'arb'},
    {t:'tf',q:'Dans l\'implémentation par liste, L[2i+1] est le fils gauche de L[i].',a:true,topic:'arb'},
    {t:'tf',q:'L\'indépendance physique signifie qu\'on peut modifier le physique sans toucher au logique.',a:true,topic:'bdd'},
    {t:'tf',q:'Le schéma conceptuel est le niveau visible par l\'utilisateur final.',a:false,topic:'bdd'},
    {t:'tf',q:'Un SGBD objet stocke les données sous forme de tables.',a:false,topic:'bdd'},
    {t:'qcm',q:'La complexité de recherche dans un ABR équilibré est :',opts:['O(1)','O(log n)','O(n)','O(n²)'],a:1,topic:'arb'},
    {t:'qcm',q:'gauche(3) dans le tri par tas vaut :',opts:['5','6','7','8'],a:2,topic:'arb'},
    {t:'qcm',q:'Le terme "vue" remplace quel concept ANSI/SPARC ?',opts:['Schéma interne','Schéma conceptuel','Schéma externe','Tous les schémas'],a:2,topic:'bdd'},
    {t:'qcm',q:'La suppression d\'un nœud ABR avec 2 fils le remplace par :',opts:['N\'importe quel nœud','Le minimum du sous-arbre droit','Le maximum du sous-arbre droit','La racine'],a:1,topic:'arb'},
    {t:'qcm',q:'L\'architecture ANSI/SPARC a été proposée par :',opts:['Alan Turing','Charles Bachman','Edgar Codd','Bill Gates'],a:1,topic:'bdd'},
    {t:'qcm',q:'Un SGBD hiérarchique stocke les données sous forme de :',opts:['Table','Graphe','Arbre','Objet'],a:2,topic:'bdd'},
    {t:'qcm',q:'La propriété qui dit que chaque donnée est stockée une seule fois est :',opts:['Cohérence','Non-redondance','Partageabilité','Indépendance'],a:1,topic:'bdd'},
  ]
};

// ══════════════════════════════════════════════════════
// EXERCISES DATA
// ══════════════════════════════════════════════════════
const EXOS = [
  {q:'Écrire une fonction qui retourne le nombre de nœuds d\'un arbre.',lv:'e',topic:'arb',
   sol:`def nbre_noeud(arb):
    if arb == None: return 0
    return 1 + nbre_noeud(arb[1]) + nbre_noeud(arb[2])`},
  {q:'Écrire une fonction qui retourne la hauteur d\'un arbre.',lv:'e',topic:'arb',
   sol:`def hauteur(arb):
    if arb == None: return 0
    return 1 + max(hauteur(arb[1]), hauteur(arb[2]))`},
  {q:'Écrire une fonction qui retourne la valeur maximale d\'un arbre binaire.',lv:'m',topic:'arb',
   sol:`def max_arb(A):
    if A[1]==None and A[2]==None: return A[0]
    if A[1]!=None and A[2]!=None:
        return max(A[0], max_arb(A[1]), max_arb(A[2]))
    elif A[1]!=None: return max(A[0], max_arb(A[1]))
    else: return max(A[0], max_arb(A[2]))`},
  {q:'Écrire une fonction qui vérifie si un arbre est un ABR.',lv:'h',topic:'arb',
   sol:`def est_abr(A):
    if A==None: return True
    return (A[1]==None or max_arb(A[1])<=A[0]) and \\
           (A[2]==None or min_arb(A[2])>A[0]) and \\
           est_abr(A[1]) and est_abr(A[2])`},
  {q:'Écrire la recherche dichotomique dans un ABR.',lv:'m',topic:'arb',
   sol:`def rechDic(x, Abr):
    if Abr==None: return False
    if x==Abr[0]: return True
    if x<Abr[0]: return rechDic(x,Abr[1])
    return rechDic(x,Abr[2])`},
  {q:'Écrire la fonction d\'insertion dans un ABR.',lv:'m',topic:'arb',
   sol:`def inserer(arb, v):
    if arb==None: return [v,None,None]
    if v<=arb[0]: arb[1]=inserer(arb[1],v)
    else: arb[2]=inserer(arb[2],v)
    return arb`},
  {q:'Donner la définition complète d\'une base de données.',lv:'e',topic:'bdd',
   sol:`Une BD est un recueil d'informations liées à un sujet donné.
Plus précisément : entité permettant de stocker des données
de façon STRUCTURÉE avec le MOINS DE REDONDANCE possible,
exploitables par des utilisateurs DIFFÉRENTS.`},
  {q:'Quels sont les 3 niveaux de l\'architecture ANSI/SPARC ?',lv:'e',topic:'bdd',
   sol:`1. SE — Schéma Externe : vue de l'utilisateur (portion de BD)
2. SC — Schéma Conceptuel : structure logique globale
3. SI — Schéma Interne : implémentation physique sur disque

Proposée par Charles Bachman en 1965 (Prix Turing).`},
  {q:'Citer 5 caractéristiques d\'un SGBD.',lv:'m',topic:'bdd',
   sol:`1. Indépendance physique : modifier physique sans toucher logique
2. Non-redondance : chaque donnée stockée une seule fois
3. Partageabilité : accès simultané de plusieurs utilisateurs
4. Sécurité : droits d'accès par utilisateur
5. Cohérence : contraintes d'intégrité vérifiées automatiquement
(+ efficacité, résistance aux pannes, manipulabilité...)`},
  {q:'Quels sont les 5 types de SGBD et leurs caractéristiques ?',lv:'h',topic:'bdd',
   sol:`1. Hiérarchique : données en ARBRE + pointeurs
2. Réseau : données en GRAPHE quelconque + pointeurs
3. Relationnel (SGBDR) : tables lignes/colonnes, SQL (MySQL, Oracle)
4. Déductif : tables + langage logique
5. Objet (SGBDO) : données en classes/objets (instances)`},
  {q:'Écrire les fonctions gauche(i) et droite(i) pour le tri par tas.',lv:'e',topic:'arb',
   sol:`def gauche(i): return 2*i + 1
def droite(i): return 2*i + 2`},
  {q:'Décrire les 3 types d\'utilisateurs d\'une BD.',lv:'e',topic:'bdd',
   sol:`1. ADMINISTRATEUR : contrôle la BD, gère les droits d'accès,
   maintient les performances, gère les sauvegardes/pannes.

2. PROGRAMMEUR : écrit les applications utilisant la BD,
   crée les tables, vues et index.

3. UTILISATEUR FINAL : accède uniquement aux données 
   qui lui sont autorisées, via applications ou requêtes directes.`},
];

// ══════════════════════════════════════════════════════
// STATE
// ══════════════════════════════════════════════════════
const ADMIN = {u:'admin',p:'admin123'};
let S = {user:null,av:'🦊',xp:0,streak:1,games:0,gems:5,dailyXP:0,
         courses:JSON.parse(localStorage.getItem('al_courses')||'null')||COURSES_DATA,
         users:JSON.parse(localStorage.getItem('al_users')||'{}')};

function save(){
  if(!S.user) return;
  S.users[S.user]={av:S.av,xp:S.xp,streak:S.streak,games:S.games,gems:S.gems};
  localStorage.setItem('al_users',JSON.stringify(S.users));
  localStorage.setItem('al_courses',JSON.stringify(S.courses));
}

// ══════════════════════════════════════════════════════
// AUTH
// ══════════════════════════════════════════════════════
let selAv='🦊';
document.querySelectorAll('.av').forEach(el=>el.addEventListener('click',()=>{
  document.querySelectorAll('.av').forEach(x=>x.classList.remove('on'));
  el.classList.add('on'); selAv=el.dataset.v;
}));

function switchTab(t){
  document.getElementById('fLogin').style.display=t==='login'?'block':'none';
  document.getElementById('fReg').style.display=t==='reg'?'block':'none';
  document.querySelectorAll('.tab').forEach((b,i)=>b.classList.toggle('on',(t==='login'&&i===0)||(t==='reg'&&i===1)));
}

function doLogin(){
  const u=document.getElementById('lu').value.trim();
  const p=document.getElementById('lp').value;
  if(!u||!p){toast('⚠️ Remplis tous les champs !');return;}
  if(u===ADMIN.u&&p===ADMIN.p){loginAs('admin','⚙️',999,7,99,50);return;}
  if(!S.users[u]||S.users[u].p!==p){toast('❌ Identifiants incorrects');return;}
  const d=S.users[u];
  loginAs(u,d.av,d.xp||0,d.streak||1,d.games||0,d.gems||5);
}

function doRegister(){
  const u=document.getElementById('ru').value.trim();
  const p=document.getElementById('rp').value;
  if(!u||!p){toast('⚠️ Remplis tous les champs !');return;}
  if(u===ADMIN.u){toast('❌ Nom réservé');return;}
  if(S.users[u]){toast('❌ Pseudo déjà pris !');return;}
  S.users[u]={p,av:selAv,xp:0,streak:1,games:0,gems:5};
  localStorage.setItem('al_users',JSON.stringify(S.users));
  loginAs(u,selAv,0,1,0,5);
}

function loginAs(u,av,xp,streak,games,gems){
  S.user=u; S.av=av; S.xp=xp; S.streak=streak; S.games=games; S.gems=gems||5;
  document.getElementById('authWrap').classList.remove('show');
  document.getElementById('app').classList.add('on');
  document.getElementById('uav').textContent=av;
  document.getElementById('xpN').textContent=xp;
  document.getElementById('strkN').textContent=streak;
  document.getElementById('gemN').textContent=gems||5;
  document.getElementById('hName').textContent=u==='admin'?'Admin 👑':u+'!';
  if(u===ADMIN.u) document.getElementById('tn-adm').style.display='flex';
  renderHome(); renderSkillTree(); renderExercises(); renderGame(); renderLB(); renderAdmin(); updateProfile();
  initChat();
  toast('🎉 Bienvenue '+u+' !');
}

// ══════════════════════════════════════════════════════
// NAV
// ══════════════════════════════════════════════════════
function nav(p){
  document.querySelectorAll('.pg').forEach(e=>e.classList.remove('on'));
  document.querySelectorAll('.tn').forEach(e=>e.classList.remove('on'));
  document.getElementById('pg-'+p).classList.add('on');
  const btn=document.getElementById('tn-'+p);
  if(btn) btn.classList.add('on');
  if(p==='lb') renderLB();
  if(p==='prof') updateProfile();
}

// ══════════════════════════════════════════════════════
// HOME
// ══════════════════════════════════════════════════════
function renderHome(){
  const pct=Math.min(100,Math.round((S.dailyXP/50)*100));
  document.getElementById('dailyFill').style.width=pct+'%';
  document.getElementById('dailyTxt').textContent=S.dailyXP+'/50 XP aujourd\'hui';
  const grid=document.getElementById('cGrid');
  grid.innerHTML=S.courses.map((c,i)=>{
    const prog=c.lessons?Math.round(c.lessons.filter(l=>l.done).length/c.lessons.length*100):0;
    return `<div class="cc${c.locked?' lock':''}" onclick="${c.locked?'toast(\"🔒 Cours bientôt disponible !\")':'openCourse(\"'+c.id+'\")'}" >
      ${prog>=100?'<div class="cc-badge">✅ Terminé</div>':''}
      <div class="cc-icon">${c.icon}</div>
      <div class="cc-title">${c.title}</div>
      <div class="cc-desc">${c.desc}</div>
      <div class="cc-prog"><div class="cc-fill" style="width:${prog}%"></div></div>
      <div class="cc-meta">${c.level} • ${c.lessons?c.lessons.length:0} leçons • ${prog}% complété</div>
    </div>`;
  }).join('')+`<div class="cc lock">
    <div class="cc-icon">🔜</div>
    <div class="cc-title">Prochain cours</div>
    <div class="cc-desc">Bientôt disponible — ajouté par l'admin !</div>
    <div class="cc-prog"><div class="cc-fill" style="width:0%"></div></div>
    <div class="cc-meta">À venir</div>
  </div>`;
  const lb=document.getElementById('lbMini');
  const allU=Object.entries(S.users).sort((a,b)=>(b[1].xp||0)-(a[1].xp||0)).slice(0,5);
  lb.innerHTML=allU.length?allU.map(([n,d],i)=>`
    <div class="lb-row">
      <div class="lb-rank ${i===0?'g1':i===1?'g2':i===2?'g3':''}">${i===0?'🥇':i===1?'🥈':i===2?'🥉':(i+1)+'.'}</div>
      <div class="lb-av">${d.av||'🦊'}</div>
      <div class="lb-name">${n}${n===S.user?' (toi)':''}</div>
      <div class="lb-xp">⭐ ${d.xp||0}</div>
    </div>`).join(''):'<p style="color:var(--gray);font-size:.85rem;text-align:center;padding:12px">Pas encore de joueurs — invite tes amis !</p>';
}

function openCourse(id){
  const c=S.courses.find(x=>x.id===id);
  if(!c) return;
  document.getElementById('pathTitle').textContent=c.title;
  document.getElementById('pathDesc').textContent=c.desc;
  nav('cours');
  renderSkillTree(id);
}

// ══════════════════════════════════════════════════════
// SKILL TREE
// ══════════════════════════════════════════════════════
let currentCourse='arbres';
function renderSkillTree(id){
  if(id) currentCourse=id;
  const c=S.courses.find(x=>x.id===currentCourse)||S.courses[0];
  const tree=document.getElementById('skillTree');
  document.getElementById('pathTitle').textContent=c.title;
  document.getElementById('pathDesc').textContent=c.desc+' — '+c.lessons.length+' leçons';

  // Select course tabs
  let tabs=`<div style="display:flex;gap:8px;margin-bottom:20px;flex-wrap:wrap">`;
  S.courses.forEach(co=>{
    tabs+=`<button style="padding:8px 18px;border:2.5px solid ${co.id===currentCourse?'var(--green)':'var(--gray-l)'};background:${co.id===currentCourse?'var(--green-l)':'#fff'};border-radius:20px;font-family:Nunito,sans-serif;font-weight:800;font-size:.83rem;cursor:pointer;color:${co.id===currentCourse?'var(--green-d)':'var(--gray)'};transition:all .2s" onclick="renderSkillTree('${co.id}')">${co.icon} ${co.title}</button>`;
  });
  tabs+='</div>';

  const nodes=c.lessons.map((l,i)=>{
    const done=l.done;
    const active=!done&&(i===0||c.lessons[i-1].done);
    const locked=!done&&!active;
    const cls=done?'done':active?'active':'locked';
    return `
    <div style="display:flex;flex-direction:column;align-items:center;">
      ${i>0?`<div class="connector ${c.lessons[i-1].done?'done':''}"></div>`:''}
      <div class="skill-node">
        <div class="skill-btn ${cls}" onclick="${locked?'toast(\"🔒 Termine la leçon précédente d\'abord !\")':'openLesson(\"'+c.id+'\",\"'+l.id+'\")'}" title="${l.title}">
          ${done?'✅':locked?'🔒':l.icon}
          ${active?'<div style="position:absolute;top:-6px;right:-6px;background:var(--blue);color:#fff;border-radius:50%;width:18px;height:18px;font-size:.6rem;display:flex;align-items:center;justify-content:center;font-weight:900">▶</div>':''}
        </div>
        <div class="skill-lbl">${l.title}</div>
      </div>
    </div>`;
  }).join('');

  tree.innerHTML=tabs+`<div style="display:flex;flex-direction:column;align-items:center;">${nodes}</div>`;
}

function openLesson(cid,lid){
  const c=S.courses.find(x=>x.id===cid);
  const l=c.lessons.find(x=>x.id===lid);
  document.getElementById('lmCourse').textContent=c.title.toUpperCase();
  document.getElementById('lmTitle').textContent=l.title;
  document.getElementById('lmBody').innerHTML=`<button class="speak-btn" onclick="speakLesson('${cid}','${lid}')">🔊 Écouter cette leçon</button>`+l.content;
  document.getElementById('lmStart').dataset.cid=cid;
  document.getElementById('lmStart').dataset.lid=lid;
  document.getElementById('lessonModal').classList.add('show');
  addXP(5); l.done=true; save();
}

function closeLesson(){
  document.getElementById('lessonModal').classList.remove('show');
  renderSkillTree(); renderHome();
}

function startLessonGame(){
  closeLesson(); nav('game'); startGame();
}

// ══════════════════════════════════════════════════════
// EXERCISES
// ══════════════════════════════════════════════════════
let exFilter='all';
function renderExercises(){
  const list=document.getElementById('exList');
  const filtered=EXOS.filter(e=>exFilter==='all'||(exFilter==='bdd'?e.topic==='bdd':exFilter==='arb'?e.topic==='arb':e.lv===exFilter));
  list.innerHTML=filtered.map((ex,i)=>`
    <div class="exc">
      <span class="ex-badge ${ex.lv}">${ex.lv==='e'?'🟢 Facile':ex.lv==='m'?'🟡 Moyen':'🔴 Difficile'}</span>
      <span class="ex-badge" style="background:${ex.topic==='arb'?'var(--green-l)':'var(--blue-l)'};color:${ex.topic==='arb'?'var(--green-d)':'var(--blue-d)';margin-left:6px}">${ex.topic==='arb'?'🌳 Arbres':'🗄️ BD'}</span>
      <div class="ex-q">📝 ${ex.q}</div>
      <button class="sbtn" onclick="toggleSol(${i},this)">👁️ Voir la solution</button>
      <div class="sol" id="sol${i}">
        <div class="sol-lbl">✅ Solution</div>
        <div class="cb">${ex.sol}</div>
      </div>
    </div>`).join('');
}

function filterEx(f,btn){
  exFilter=f;
  document.querySelectorAll('.ef').forEach(b=>b.classList.remove('on'));
  btn.classList.add('on');
  renderExercises();
}

function toggleSol(i,btn){
  const el=document.getElementById('sol'+i);
  const op=el.classList.contains('op');
  el.classList.toggle('op'); el.style.display=op?'none':'block';
  if(!op){addXP(3);toast('👁️ Solution révélée +3 XP');}
}

// ══════════════════════════════════════════════════════
// GAME
// ══════════════════════════════════════════════════════
let gLvl='e',gIdx=0,gHearts=3,gScore=0,gAnswered=false,gQs=[],gCombo=0;

function setLvl(l){
  gLvl=l;
  document.querySelectorAll('.lp').forEach(b=>b.classList.remove('on'));
  document.querySelector('.lp.'+l).classList.add('on');
  startGame();
}

function startGame(){
  gQs=[...QS[gLvl]].sort(()=>Math.random()-.5).slice(0,10);
  gIdx=0; gHearts=3; gScore=0; gAnswered=false; gCombo=0;
  document.getElementById('endCard').classList.remove('show');
  renderQ();
}

function renderQ(){
  const area=document.getElementById('gameArea');
  if(gIdx>=gQs.length){showEnd();return;}
  const q=gQs[gIdx];
  const pct=Math.round((gIdx/gQs.length)*100);
  area.innerHTML=`
    <div class="ghud">
      <span style="font-weight:800;font-size:.85rem;color:var(--gray)">${gIdx+1}/${gQs.length}</span>
      <div class="ghud-bar"><div class="ghud-fill" style="width:${pct}%"></div></div>
      <div class="ghud-hearts">${'❤️'.repeat(gHearts)}${'🖤'.repeat(3-gHearts)}</div>
      <div class="ghud-sc">⭐${gScore}</div>
    </div>
    <div class="qbox">
      <div class="qtype">${q.t==='tf'?'✅ VRAI ou FAUX ?':'🎯 QCM — Une seule réponse'} ${q.topic==='bdd'?'🗄️':'🌳'}</div>
      <div class="qq">${q.q}</div>
      ${q.t==='tf'?`<div class="tf-row"><button class="tf" onclick="answerTF(true)">✅ VRAI</button><button class="tf" onclick="answerTF(false)">❌ FAUX</button></div>`
      :`<div class="opts">${q.opts.map((o,i)=>`<button class="opt" id="o${i}" onclick="answerQCM(${i})">${o}</button>`).join('')}</div>`}
      <div class="fb" id="fb"></div>
      <button class="nbtn" id="nbtn" onclick="nextQ()">Continuer →</button>
    </div>`;
}

function answerTF(v){
  if(gAnswered) return; gAnswered=true;
  const ok=v===gQs[gIdx].a;
  showFB(ok,gQs[gIdx].a?'C\'était VRAI ✅':'C\'était FAUX ❌');
  document.querySelectorAll('.tf').forEach(b=>b.disabled=true);
}

function answerQCM(i){
  if(gAnswered) return; gAnswered=true;
  const q=gQs[gIdx]; const ok=i===q.a;
  document.querySelectorAll('.opt').forEach((b,j)=>{b.disabled=true;if(j===q.a)b.classList.add('ok');else if(j===i&&!ok)b.classList.add('no');});
  showFB(ok,'Réponse : '+q.opts[q.a]);
}

function showFB(ok,msg){
  if(ok){
    gScore+=10; gCombo++;
    addXP(gCombo>=3?15:10);
    if(gCombo>=3) showCombo('🔥 COMBO x'+gCombo+'!');
    flyXP(gCombo>=3?'+15 XP':'+10 XP');
  } else {
    gHearts--; gCombo=0;
    if(gHearts<=0){setTimeout(()=>{toast('💔 Plus de vies !');startGame();},1500);return;}
  }
  const fb=document.getElementById('fb');
  fb.className='fb '+(ok?'ok':'no');
  fb.innerHTML=(ok?'🎉 Excellent ! ':'😅 Raté ! ')+msg;
  document.getElementById('nbtn').style.display='block';
}

function nextQ(){ gIdx++; gAnswered=false; renderQ(); }

function showEnd(){
  S.games++;
  document.getElementById('gameArea').innerHTML='';
  const ec=document.getElementById('endCard');
  ec.classList.add('show');
  document.getElementById('endStars').textContent=gScore>=80?'⭐⭐⭐':gScore>=50?'⭐⭐':'⭐';
  document.getElementById('endScore').textContent=gScore+' pts';
  document.getElementById('endXp').textContent='Tu as gagné '+gScore+' XP supplémentaires !';
  addXP(gScore); save();
}

// ══════════════════════════════════════════════════════
// LEADERBOARD
// ══════════════════════════════════════════════════════
function renderLB(){
  const sorted=Object.entries(S.users).sort((a,b)=>(b[1].xp||0)-(a[1].xp||0));
  const pod=document.getElementById('podium');
  const top3=sorted.slice(0,3);
  const order=[1,0,2]; // 2nd,1st,3rd
  pod.innerHTML=order.map(i=>{
    if(!top3[i]) return '<div class="pod"></div>';
    const [n,d]=top3[i];
    return `<div class="pod p${i+1}">
      <div class="pod-av">${d.av||'🦊'}</div>
      <div class="pod-name">${n}</div>
      <div class="pod-xp">⭐ ${d.xp||0} XP</div>
      <div class="pod-bar"></div>
    </div>`;
  }).join('');
  const tbl=document.getElementById('lbTable');
  tbl.innerHTML=sorted.map(([n,d],i)=>`
    <div class="lb-tr${n===S.user?' me':''}">
      <div class="lb-rk">${i===0?'🥇':i===1?'🥈':i===2?'🥉':(i+1)}</div>
      <div class="lb-emoji">${d.av||'🦊'}</div>
      <div class="lb-nm">${n}${n===S.user?' 👈':''}</div>
      <div class="lb-pts">⭐ ${d.xp||0}</div>
      <div class="lb-badge2">${(d.xp||0)>=500?'🔥':(d.xp||0)>=200?'🌟':(d.xp||0)>=50?'✨':''}</div>
    </div>`).join('') || '<div style="padding:20px;text-align:center;color:var(--gray);font-weight:600">Pas encore de joueurs 😢</div>';
}

// ══════════════════════════════════════════════════════
// AI CHAT
// ══════════════════════════════════════════════════════
const CHIPS=['C\'est quoi un arbre ?','Explique les SGBD','Différence ABR vs arbre ?','Qu\'est-ce que SQL ?','Comment marche le parcours préfixe ?','Types de SGBD ?','Indépendance physique ?'];

function initChat(){
  const msgs=document.getElementById('chatMsgs');
  msgs.innerHTML='';
  addBotMsg(`Salut ${S.user} ! 👋 Je suis ton assistant IA spécialisé en informatique. Je peux t'expliquer <strong>n'importe quel concept</strong> de tes cours et bien plus encore — arbres, bases de données, algorithmes, SQL, Python... Pose-moi ta question ! 🚀`);
  document.getElementById('chipRow').innerHTML=CHIPS.map(c=>`<div class="chip" onclick="chipSend('${c}')">${c}</div>`).join('');
}

function chipSend(txt){document.getElementById('chatIn').value=txt;sendChat();}

let chatHistory=[];
async function sendChat(){
  const inp=document.getElementById('chatIn');
  const msg=inp.value.trim();
  if(!msg) return;
  inp.value='';
  addUserMsg(msg);
  chatHistory.push({role:'user',content:msg});
  const tid=addTyping();
  try{
    const res=await fetch('https://api.anthropic.com/v1/messages',{
      method:'POST',
      headers:{'Content-Type':'application/json'},
      body:JSON.stringify({
        model:'claude-sonnet-4-20250514',
        max_tokens:1000,
        system:`Tu es un assistant IA expert en informatique intégré dans ArbrLearn, une application éducative. Tu aides des étudiants à comprendre leurs cours d'informatique.

Les cours disponibles sont :
1. LES ARBRES : structures de données arborescentes, terminologie (racine, feuille, frère, ancêtre, degré, profondeur, hauteur), implémentation Python [valeur, gauche, droite], parcours (préfixe/infixe/suffixe/largeur), arbres binaires de recherche (ABR), tri par tas.

2. BASES DE DONNÉES : définition BD, SGBD (MySQL, Oracle, PostgreSQL, Access), architecture ANSI/SPARC (schéma interne SI / conceptuel SC / externe SE), caractéristiques SGBD (indépendance physique/logique, non-redondance, partageabilité, sécurité, cohérence, résistance pannes), types SGBD (hiérarchique, réseau, relationnel, déductif, objet), types utilisateurs (administrateur, programmeur, utilisateur final).

Réponds de façon claire, pédagogique et engageante. Utilise des exemples concrets. Tu peux répondre sur TOUS les sujets informatiques (Python, algorithmes, SQL, réseaux, etc.) sans aucune restriction. Réponds en français. Formate bien tes réponses avec des sauts de ligne pour la lisibilité.`,
        messages:chatHistory.slice(-10)
      })
    });
    const data=await res.json();
    removeTyping(tid);
    const reply=data.content?data.content.map(b=>b.text||'').join('\n'):'Désolé, je n\'ai pas pu répondre. Réessaie !';
    chatHistory.push({role:'assistant',content:reply});
    addBotMsg(reply.replace(/\n/g,'<br>').replace(/\*\*(.+?)\*\*/g,'<strong>$1</strong>'));
  } catch(e){
    removeTyping(tid);
    addBotMsg('⚠️ Connexion à l\'IA momentanément indisponible. Vérifie ta connexion et réessaie !');
  }
}

function addUserMsg(txt){
  const div=document.createElement('div');
  div.className='msg usr'; div.textContent=txt;
  document.getElementById('chatMsgs').appendChild(div);
  scrollChat();
}

function addBotMsg(html){
  const div=document.createElement('div');
  div.className='msg bot'; div.innerHTML='🤖 '+html;
  document.getElementById('chatMsgs').appendChild(div);
  scrollChat();
}

let typId=0;
function addTyping(){
  const id=++typId;
  const div=document.createElement('div');
  div.className='msg typing'; div.id='typ'+id;
  div.innerHTML='<div class="dot-anim"><span></span><span></span><span></span></div>';
  document.getElementById('chatMsgs').appendChild(div);
  scrollChat(); return id;
}

function removeTyping(id){
  const el=document.getElementById('typ'+id);
  if(el) el.remove();
}

function scrollChat(){
  const c=document.getElementById('chatMsgs');
  c.scrollTop=c.scrollHeight;
}

// ══════════════════════════════════════════════════════
// PROFILE & BADGES
// ══════════════════════════════════════════════════════
const BADGES=[
  {ico:'🌱',nm:'Graine',cond:()=>true},
  {ico:'📚',nm:'Lecteur',cond:()=>S.xp>=20},
  {ico:'🌿',nm:'Bourgeon',cond:()=>S.xp>=50},
  {ico:'🎮',nm:'Joueur',cond:()=>S.games>=1},
  {ico:'🌳',nm:'Arbre',cond:()=>S.xp>=200},
  {ico:'🔥',nm:'En Feu',cond:()=>S.streak>=3},
  {ico:'🏆',nm:'Champion',cond:()=>S.games>=5},
  {ico:'💎',nm:'Diamant',cond:()=>S.xp>=500},
  {ico:'🦉',nm:'Sage',cond:()=>S.xp>=1000},
  {ico:'⚡',nm:'Expert',cond:()=>S.games>=10},
];

function updateProfile(){
  document.getElementById('pAv').textContent=S.av;
  document.getElementById('pName').textContent=S.user;
  const lv=S.xp<50?'Niveau 1 — Graine 🌱':S.xp<200?'Niveau 2 — Bourgeon 🌿':S.xp<500?'Niveau 3 — Arbre 🌳':S.xp<1000?'Niveau 4 — Forêt 🌲':'Niveau 5 — Sage 🦉';
  document.getElementById('pLvl').textContent=lv;
  document.getElementById('sXP').textContent=S.xp;
  document.getElementById('sStr').textContent=S.streak;
  document.getElementById('sG').textContent=S.games;
  document.getElementById('bgGrid').innerHTML=BADGES.map(b=>`<div class="bg-item ${b.cond()?'earn':''}"><div class="bg-ico">${b.ico}</div><div class="bg-nm">${b.nm}</div></div>`).join('');
}

// ══════════════════════════════════════════════════════
// ADMIN
// ══════════════════════════════════════════════════════
function renderAdmin(){
  if(S.user!==ADMIN.u) return;
  const list=document.getElementById('existList');
  list.innerHTML=S.courses.map((c,i)=>`<div class="ei"><span>${c.icon} ${c.title} — ${c.lessons.length} leçons — ${c.level}</span>${i>1?`<button class="del-btn" onclick="delCourse(${i})">🗑️</button>`:'<span style="font-size:.75rem;color:var(--gray)">Cours principal</span>'}</div>`).join('');
}

function addCourse(){
  const icon=document.getElementById('aIcon').value.trim()||'📘';
  const title=document.getElementById('aTitle').value.trim();
  const desc=document.getElementById('aDesc').value.trim();
  const cont=document.getElementById('aCont').value.trim();
  const lvl=document.getElementById('aLvl').value;
  if(!title||!cont){toast('⚠️ Titre et contenu requis !');return;}
  const id='c_'+Date.now();
  const lessons=cont.split('###').filter(c=>c.trim()).map((ct,i)=>{
    const lines=ct.trim().split('\n');
    return {id:'l'+i,icon:'📖',title:lines[0].trim(),done:false,content:'<p>'+lines.slice(1).join('<br>').trim()+'</p>'};
  });
  if(!lessons.length) lessons.push({id:'l0',icon:'📖',title:'Chapitre 1',done:false,content:'<p>'+cont+'</p>'});
  S.courses.push({id,icon,title,desc,level:lvl,locked:false,lessons});
  localStorage.setItem('al_courses',JSON.stringify(S.courses));
  renderAdmin(); renderHome();
  document.getElementById('aTitle').value=''; document.getElementById('aCont').value='';
  toast('✅ Cours "'+title+'" ajouté !');
}

function delCourse(i){
  S.courses.splice(i,1);
  localStorage.setItem('al_courses',JSON.stringify(S.courses));
  renderAdmin(); renderHome();
  toast('🗑️ Cours supprimé');
}

// ══════════════════════════════════════════════════════
// XP & VOICE & UTILS
// ══════════════════════════════════════════════════════
function addXP(n){
  S.xp+=n; S.dailyXP+=n;
  document.getElementById('xpN').textContent=S.xp;
  document.getElementById('sXP').textContent=S.xp;
  const pct=Math.min(100,Math.round((S.dailyXP/50)*100));
  const df=document.getElementById('dailyFill');
  if(df){df.style.width=pct+'%'; document.getElementById('dailyTxt').textContent=S.dailyXP+'/50 XP aujourd\'hui';}
  save();
}

function flyXP(txt){
  const el=document.createElement('div');
  el.className='xp-fly'; el.textContent=txt;
  el.style.cssText=`left:${window.innerWidth/2-20}px;top:${window.innerHeight*0.4}px;`;
  document.body.appendChild(el);
  setTimeout(()=>el.remove(),1300);
}

function showCombo(txt){
  const el=document.createElement('div');
  el.className='combo-flash'; el.textContent=txt;
  document.body.appendChild(el);
  setTimeout(()=>el.remove(),900);
}

function toast(msg){
  const t=document.getElementById('toast');
  t.textContent=msg; t.classList.add('on');
  setTimeout(()=>t.classList.remove('on'),2500);
}

// VOICE
let speaking=false;
function toggleVoice(){
  if(speaking){window.speechSynthesis.cancel();speaking=false;document.getElementById('voiceBtn').textContent='🔊';document.getElementById('voiceBtn').classList.remove('on');}
  else{
    const pg=document.querySelector('.pg.on');
    if(pg){speakText(pg.innerText.substring(0,600));}
  }
}

function speakLesson(cid,lid){
  const c=S.courses.find(x=>x.id===cid);
  const l=c.lessons.find(x=>x.id===lid);
  const tmp=document.createElement('div'); tmp.innerHTML=l.content;
  speakText(l.title+'. '+tmp.innerText);
}

function speakText(text){
  if(!window.speechSynthesis){toast('🔇 Synthèse vocale non disponible');return;}
  window.speechSynthesis.cancel();
  const u=new SpeechSynthesisUtterance(text);
  u.lang='fr-FR'; u.rate=0.9; u.pitch=1.05;
  const vs=window.speechSynthesis.getVoices();
  const fv=vs.find(v=>v.lang.startsWith('fr'));
  if(fv) u.voice=fv;
  u.onstart=()=>{speaking=true;document.getElementById('voiceBtn').textContent='⏹️';document.getElementById('voiceBtn').classList.add('on');};
  u.onend=()=>{speaking=false;document.getElementById('voiceBtn').textContent='🔊';document.getElementById('voiceBtn').classList.remove('on');};
  window.speechSynthesis.speak(u);
}

// ══════════════════════════════════════════════════════
// INIT
// ══════════════════════════════════════════════════════
window.addEventListener('load',()=>{
  window.speechSynthesis.getVoices();
  startGame();
  setTimeout(()=>{
    document.getElementById('splash').classList.add('hide');
    setTimeout(()=>{
      document.getElementById('splash').style.display='none';
      document.getElementById('authWrap').classList.add('show');
    },700);
  },2000);
});
</script>

</body>
</html>
