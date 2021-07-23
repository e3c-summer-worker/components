import { auth, sheets_v4 } from '@googleapis/sheets';


const getSheets = async (): Promise<sheets_v4.Sheets> => {
    // we're explicitly passing it the stuff in ./secrets.json

    // replacing '\n' in environment variable with real line breaks
    // without it, you'll get a PEM routine error (get_name:no start line)
    // https://github.com/auth0/node-jsonwebtoken/issues/642#issuecomment-585173594
    const secret = process.env.GOOGLE_CLIENT_SECRET.replace(/\\n/gm, '\n');

    const googleAuth = new auth.GoogleAuth({
        scopes: ['https://www.googleapis.com/auth/spreadsheets.readonly'],
        credentials: {
            client_email: process.env.GOOGLE_CLIENT_EMAIL,
            private_key: secret
        }
    })

    const sheets = new sheets_v4.Sheets({ auth: googleAuth })

    return sheets
}

export { getSheets }