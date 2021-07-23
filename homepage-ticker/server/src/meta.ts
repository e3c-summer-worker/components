// metadata about the sheet


import { sheets_v4 } from '@googleapis/sheets';

const getLength = async (sheets: sheets_v4.Sheets): Promise<number> => {
    // get length
    const response = await sheets.spreadsheets.values.get({
        spreadsheetId: process.env.SHEET_ID,
        range: 'Metadata!A2:A2'
    })

    const length = response.data.values[0][0]

    return length
}

export { getLength }