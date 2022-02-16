## Romaji2Hiragana plugin for MuseScore3
Romaji2Hiragana is a plugin script for MuseScore3 which converts romaji lyrics like 'ra' and 'to' to 「ら」 and 「と」.

Makes kana lyric entry easier to work around MS3's issues with kana entry using a JP keyboard or EN keyboard with IME.

This version is forked from the original to add major improvements, since the original seems to be abandoned.

### Usage
Set the lyrics of your composition in MuseScore3 to romaji. Running the plugin will convert all lyrics to their respective kana. Supports multiple romanizations of kana such as shi/si-し、dji/di-ぢ、etc.
For lyrics such as 「なった」 spread over two notes, they can be entered as either nat -ta or na -tta, depending on whether you want なっ -た or な -った

### Limitations
This plugin will overwrite *all* lyrics in the score, including existing kana. Make sure to run only once all romaji have been entered.

「は」、「へ」、「を」 must be entered as 'ha', 'he', 'wo', regardless of pronunciation. Code can't read your mind :)

Diacritics are not supported; enter long vowels as double letters, i.e. 「もう」 should be entered as "mou" not mō or mô.

Any non-Japanese lyrics using Latin will be converted to kana with potentially unwanted results. Either change them manually afterwards, or don't enter mixed-language lyrics until after kana conversion is complete.

### Changelog

#### Changes in version 1.1.1
- Fixed issues with conversion of capital letters
- Added support for punctuation:
	- 。 (.)
	- 、 (,)
	- ？ (?)
	- _ (unchanged)

#### Changes in version 1.1.0
- Edited kana conversion list to fix incorrect conversion of certain kana
- Added single consonant-to-っ conversion
- Added alternate conversions for morae containing:
	- し (shi/si)
	- ち (chi/ti)
	- つ (tsu/tu)
	- ふ (fu/hu)
	- じ (ji/zi)
	- ぢ (dji/di)
	- づ (dzu/zu)
	- And all -ゃ　-ゅ　-ょ derivatives
- Plugin now processes whole lyric, allowing for polysyllabic lyrics such as 「なき」、「さあ」、「しかし」、etc.

#### Before and after using plugin (OLD, WILL BE UPDATED)
![image](beforeandafter.png)

