import QtQuick 2.0
import MuseScore 3.0

MuseScore {
    menuPath: "Plugins.Romaji2Hiragana"
    description: "Convert romaji lyrics to hiragana."
    version: "1.0"
    onRun: {
        var kana = {
            a: 'あ',
            i: 'い',
            u: 'う',
            e: 'え',
            o: 'お',
            ka: 'か',
            ki: 'き',
            ku: 'く',
            ke: 'け',
            ko: 'こ',
            ga: 'が',
            gi: 'ぎ',
            gu: 'ぐ',
            ge: 'げ',
            go: 'ご ',
            sa: 'さ',
            shi: 'し',
            su: 'す',
            se: 'せ',
            so: 'そ',
            za: 'ざ',
            ji: 'じ',
            zu: 'ず',
            ze: 'ぜ',
            zo: 'ぞ',
            ta: 'た',
            chi: 'ち',
            tsu: 'つ',
            te: 'て',
            to: 'と',
            da: 'だ',
            dzi: 'ぢ',
            dzu: 'づ',
            de: 'で',
            do: 'ど',
            na: 'な',
            ni: 'に',
            nu: 'ぬ',
            ne: 'ね',
            no: 'の',
            ha: 'は',
            hi: 'ひ',
            fu: 'ふ',
            he: 'へ',
            ho: 'ほ',
            ba: 'ば',
            bi: 'び',
            bu: 'ぶ',
            be: 'べ',
            bo: 'ぺ',
            pa: 'ぱ',
            pi: 'ぴ',
            pu: 'ぷ',
            pe: 'ぼ',
            po: 'ぽ',
            ma: 'ま',
            mi: 'み',
            mu: 'む',
            me: 'め',
            mo: 'も',
            ya: 'や',
            yu: 'ゆ',
            yo: 'よ',
            ra: 'ら',
            ri: 'り',
            ru: 'る',
            re: 'れ',
            ro: 'ろ',
            wa: 'わ',
            wi: 'ゐ',
            we: 'ゑ',
            wo: 'を',
            n: 'ん',
            kya: 'きゃ',
            kyu: 'きゅ',
            kyo: 'きょ',
            gya: 'ぎゃ',
            gyu: 'ぎゅ',
            gyo: 'ぎょ',
            sha: 'しゃ',
            shu: 'しゅ',
            sho: 'しょ',
            jya: 'じゃ',
            ja: 'じゃ',
            jyu: 'じゅ',
            ju: 'じゅ',
            jyo: 'じょ',
            jo: 'じょ',
            cha: 'ちゃ',
            chu: 'ちゅ',
            cho: 'ちょ',
            dzya: 'ぢゃ',
            dzyu: 'ぢゅ',
            dzyo: 'ぢょ',
            nya: 'にゃ',
            nyu: 'にゅ',
            nyo: 'にょ',
            hya: 'ひゃ',
            hyu: 'ひゅ',
            hyo: 'ひょ',
            bya: 'びゃ',
            byu: 'びゅ',
            byo: 'びょ',
            pya: 'ぴゃ',
            pyu: 'ぴゅ',
            pyo: 'ぴょ',
            mya: 'みゃ',
            myu: 'みゅ',
            myo: 'みょ',
            rya: 'りゃ',
            ryu: 'りゅ',
            ryo: 'りょ'
        };

        var cursor = curScore.newCursor();
        var sArray= new Array();
        for (var track = 0; track < curScore.ntracks; ++track) {
            cursor.track = track;
            cursor.rewind(0);  // set cursor to first chord/rest
            while (cursor.segment) {
                if (cursor.element && cursor.element.type == Element.CHORD) {
                    var lyrics = cursor.element.lyrics;
                    for (var i = 0; i < lyrics.length; i++) {
                        var l = lyrics[i];
                        if (!l)
                            continue;
                        if (sArray[i] == undefined)
                            sArray[i] = "";
                        else {
                            if (kana[l.text.toLowerCase()] == undefined) continue;
                            sArray[i] += kana[l.text.toLowerCase()];
                            l.text = kana[l.text.toLowerCase()];
                        }
                    }
                }
                cursor.next();
            }
        }

        for (var i = 0; i < sArray.length; i++) {
            console.log(sArray[i]);
        }

        Qt.quit();
    }
}
