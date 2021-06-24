import React from 'react'

const Nav: React.FC = () => (
    <div id="siteWrapper" className="clearfix">
        <div className="header-inner">
            {/* header nav changed from customMain */}
            <div id="headerNav" style={{ visibility: 'hidden', color: 'black' }}>
                <div id="mainNavWrapper" className="nav-wrapper" data-content-field="navigation-mainNav">
                    <nav id="mainNavigation" data-content-field="navigation-mainNav" className="sqs-frontend-overlay-editor-widget-host">
                        <div className="collection">
                            {/* UPDATE: page reference */}
                            <a href="/covid19">
                                {/* UPDATE: menu display text */}
                                COVID-19
                            </a>
                        </div>
                        <div className="folder">
                            {/* <!--UPDATE: Folder Display Text--> */}
                            <div className="folder-toggle" data-href="/meet-the-team-1">About</div>
                            <div className="subnav">
                                <div className="collection">
                                    {/* <!--UPDATE: page reference--> */}
                                    <a href="/meet-the-team-1">
                                        {/* <!--UPDATE: menu display text--> */}
                                        Meet Our Team
                                    </a>
                                </div>
                                <div className="collection">
                                    {/* UPDATE: page reference */}
                                    <a href="/history">
                                        {/* UPDATE: menu display text */}
                                        History
                                    </a>
                                </div>
                                <div className="collection">
                                    {/* UPDATE: page reference */}
                                    <a href="/what-we-believe">
                                        {/* UPDATE: menu display text */}
                                        What We Believe
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div className="folder">
                            {/* UPDATE: Folder Display Text */}
                            <div className="folder-toggle" data-href="/englishservice">Join Us</div>
                            <div className="subnav">
                                <div className="collection">
                                    {/* UPDATE: page reference */}
                                    <a href="/englishservice">
                                        {/* UPDATE: menu display text */}
                                        Sunday Services
                                    </a>
                                </div>
                                <div className="collection">
                                    {/* UPDATE: page reference */}
                                    <a href="/sunday-school">
                                        {/* UPDATE: menu display text */}
                                        Sunday School
                                    </a>
                                </div>
                                <div className="collection">
                                    {/* UPDATE: page reference */}
                                    <a href="/english-calendar">
                                        {/* UPDATE: menu display text */}
                                        Calendar
                                    </a>
                                </div>
                                <div className="collection">
                                    {/* UPDATE: page reference */}
                                    <a href="/englishupdates">
                                        {/* UPDATE: menu display text */}
                                        News and Updates
                                    </a>
                                </div>
                                <div className="collection">
                                    {/* UPDATE: page reference */}
                                    <a href="https://drive.google.com/drive/folders/1_cfpL4tmCzmzkm4oDtOhSXOF3uO7pBfK?usp=sharing">E3C Connect</a>
                                </div>
                            </div>
                        </div>
                        <div className="folder">
                            {/* UPDATE: Folder Display Text */}
                            <div className="folder-toggle" data-href="/english-index">Community</div>
                            <div className="subnav">
                                <div className="collection">
                                    {/* UPDATE: page reference */}
                                    <a href="/adult-cell-groups">
                                        {/* UPDATE: menu display text */}
                                        Adult Cell Groups
                                    </a>
                                </div>
                                <div className="collection">
                                    {/* UPDATE: page reference */}
                                    <a href="/iwg">
                                        {/* UPDATE: menu display text */}
                                        IWG
                                    </a>
                                </div>
                                <div className="collection">
                                    {/* UPDATE: page reference */}
                                    <a href="/life-support">
                                        {/* UPDATE: menu display text */}
                                        Life Support
                                    </a>
                                </div>
                                <div className="collection">
                                    {/* UPDATE: page reference */}
                                    <a href="/petros">
                                        {/* UPDATE: menu display text */}
                                        Petros
                                    </a>
                                </div>
                                <div className="collection">
                                    {/* UPDATE: page reference */}
                                    <a href="/samuel">
                                        {/* UPDATE: menu display text */}
                                        Samuel
                                    </a>
                                </div>
                                <div className="collection">
                                    {/* UPDATE: page reference */}
                                    <a href="/eccc-kids">
                                        {/* UPDATE: menu display text */}
                                        ECCC Kids
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div className="folder">
                            {/* UPDATE: Folder Display Text */}
                            <div className="folder-toggle" data-href='/Resources'></div>
                            <div className="subnav">
                                <div className="collection">
                                    {/* UPDATE: page reference */}
                                    <a href="https://drive.google.com/drive/folders/13Yj9ck9_EMYKBtM-F6mx3aa-szyW0ZRS?usp=sharing">
                                        {/* UPDATE: menu display text */}
                                        Docs/Forms
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div className="collection">
                            {/* UPDATE: page reference */}
                            <a href="/give-now">
                                {/* UPDATE: menu display text */}
                                Give
                            </a>
                        </div>
                    </nav>
                </div >
            </div >
        </div>
    </div>
    // < !--style below blocks out the mobile nav toggle only when nav is loaded-- >
    // <style>.mobile-nav-toggle-label {display: inline-block !important; }</style>

)

export default Nav