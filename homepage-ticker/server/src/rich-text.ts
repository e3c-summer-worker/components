// parses rich text in a spreadsheet 
// WIP

import { sheets_v4 } from '@googleapis/sheets';
import { format } from 'path/posix';
import { pairwise } from './utils';

type FormattedText = Format[] | NoFormat

interface Format {
    type: 'format',
    content: string,
    format: sheets_v4.Schema$TextFormat
}

interface NoFormat {
    type: 'noFormat',
    content: string
}

const parseRichText = (cell: sheets_v4.Schema$CellData): FormattedText => {
    // this is the unformatted string version
    const content = cell.formattedValue

    const formats = cell.textFormatRuns;

    if (!formats) {
        // no formatting
        return { type: 'noFormat', content }
    }

    // Add mock 'format' to the end of the array to ensure we actually read all the data
    // without it, we'll skip the last format
    formats.push({
        startIndex: content.length,
    })

    const output: Format[] = pairwise(formats).map(([format1, format2]) => {
        const text = content.slice(format1.startIndex, format2.startIndex);
        return {
            type: 'format',
            content: text,
            format: format1.format
        }
    })

    return output
}

export { parseRichText }
export type { FormattedText }