import QtQuick 2.0
import MuseScore 3.0

MuseScore {
    menuPath: "Plugins.Romaji2Hiragana"
    description: "Convert romaji lyrics to hiragana."
    version: "1.1"
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
            go: 'ご',
            sa: 'さ',
            shi: 'し',
            si: 'し',
            su: 'す',
            se: 'せ',
            so: 'そ',
            za: 'ざ',
            ji: 'じ',
            zi: 'じ',
            zu: 'ず',
            ze: 'ぜ',
            zo: 'ぞ',
            ta: 'た',
            chi: 'ち',
            ti: 'ち',
            tsu: 'つ',
            tu: 'つ',
            te: 'て',
            to: 'と',
            da: 'だ',
            dzi: 'ぢ',
            di: 'ぢ',
            dzu: 'づ',
            du: 'づ',
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
            hu: 'ふ',
            he: 'へ',
            ho: 'ほ',
            ba: 'ば',
            bi: 'び',
            bu: 'ぶ',
            be: 'べ',
            bo: 'ぼ',
            pa: 'ぱ',
            pi: 'ぴ',
            pu: 'ぷ',
            pe: 'ぺ',
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
            m: 'ん',
            kya: 'きゃ',
            kyu: 'きゅ',
            kyo: 'きょ',
            gya: 'ぎゃ',
            gyu: 'ぎゅ',
            gyo: 'ぎょ',
            sha: 'しゃ',
            shu: 'しゅ',
            sho: 'しょ',
            sya: 'しゃ',
            syu: 'しゅ',
            syo: 'しょ',
            ja: 'じゃ',
            ju: 'じゅ',
            jo: 'じょ',
            jya: 'じゃ',
            jyu: 'じゅ',
            jyo: 'じょ',
            cha: 'ちゃ',
            chu: 'ちゅ',
            cho: 'ちょ',
            tya: 'ちゃ',
            tyu: 'ちゅ',
            tyo: 'ちょ',
            dzya: 'ぢゃ',
            dzyu: 'ぢゅ',
            dzyo: 'ぢょ',
            dya: 'ぢゃ',
            dyu: 'ぢゅ',
            dyo: 'ぢょ',
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
            ryo: 'りょ',
            k: 'っ',
            s: 'っ',
            j: 'っ',
            z: 'っ',
            t: 'っ',
            d: 'っ',
            h: 'っ',
            f: 'っ',
            b: 'っ',
            p: 'っ',
            y: 'っ',
            r: 'っ',
            w: 'っ',

        };

        var cursor = curScore.newCursor(); for (var track = 0; track < curScore.ntracks; ++track) {
            cursor.track = track;
            cursor.rewind(0);  // set cursor to first chord/rest
            var cLyric;
            while (cursor.segment) {
                if (cursor.element && cursor.element.type === Element.CHORD) {
                    var lyrics = cursor.element.lyrics;
                    for (var i = 0; i < lyrics.length; i++) { //iterate through lyrics
                        var l = lyrics[i];
                        //console.log("Full lyric: "+l.text);
                        cLyric = "";
                        if (!l)
                            continue;
                        for(var j = 0; j < l.text.length; ++j){ //start at first character of lyric
                            for(var k = l.text.length; k >= 0; --k){ //squeeze in towards the beginning until it finds something
                                //console.log("Checking "+l.text.substring(j, k)+" of "+l.text);
                                if(kana[l.text.substring(j,k)] !== undefined){
                                    //console.log("Kana found: "+kana[l.text.substring(j, k)]);
                                    cLyric += kana[l.text.substring(j, k)];
                                    j += l.text.substring(j, k).length-1;
                                    k = l.text.length;
                                    break;
                                }
                            }
                        }
                    }
                    l.text = cLyric;
                    //console.log("Full kana: "+cLyric);
                }
                cursor.next();
            }
        }

        Qt.quit();
    }
}
