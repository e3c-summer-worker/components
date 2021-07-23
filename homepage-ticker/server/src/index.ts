import express from 'express';
import { config } from 'dotenv'
import { responseTime } from './middleware/response-time-logger';
import { getSheets } from './auth';
import { getLength } from './meta';
import { sheets_v4 } from '@googleapis/sheets';
import { FormattedText, parseRichText } from './rich-text';
config()

const app = express()

app.use(responseTime)

app.get('/', (req, res) => res.send('Hello World!'))


app.get('/meta', async (req, res) => {
    try {
        const sheets = await getSheets()

        // get length
        const length = await getLength(sheets)

        res.send(length)
    } catch (err) {
        console.log(err)
        res.status(500).send(err)
    }
})

interface Content {
    english: string,
    chinese: string,
}

app.get('/content', async (req, res) => {
    try {
        const sheets = await getSheets()

        const length = await getLength(sheets)

        const response = await sheets.spreadsheets.values.get({
            spreadsheetId: process.env.SHEET_ID,
            range: `Content!A2:B${1 + length}`
        })

        const data: Content[] = response.data.values.map(item => {
            const [english, chinese] = item
            return { english, chinese }
        })
        res.send(data)

    } catch (err) {
        console.log(err)
        res.status(500).send(err)
    }
})

// returns the rich content
// https://developers.google.com/sheets/api/reference/rest/v4/spreadsheets/cells#TextFormatRun
// significantly more difficult to parse than the plain text

interface ContentFormatted {
    english: FormattedText,
    chinese: FormattedText,
}

app.get('/rich-content', async (req, res) => {
    try {
        const sheets = await getSheets()

        const length = await getLength(sheets)

        const response = await sheets.spreadsheets.get({
            spreadsheetId: process.env.SHEET_ID,
            ranges: [`Content!A2:B${1 + length}`],
            includeGridData: true
        })

        // data[0] because we only put in the first range
        const contentGrid = response.data.sheets[0].data[0];

        const output: ContentFormatted[] = contentGrid.rowData.map((row: sheets_v4.Schema$RowData) => {
            const [englishCell, chineseCell] = row.values;
            const [english, chinese] = [parseRichText(englishCell), parseRichText(chineseCell)];

            return { english, chinese }
        })

        res.send(output)

    } catch (err) {
        console.log(err)
        res.status(500).send(err)
    }
})

// export
export { app }