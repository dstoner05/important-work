import React, { Component } from 'react';
import * as pbi from 'powerbi-client';
declare var powerbi: pbi.service.Service;

export class Home extends Component {
  static displayName = Home.name;

  async componentDidMount() {
    const response = await fetch('embedding');
    const embedInfo = await response.json();

    let config = {
      type: 'report',
      accessToken: embedInfo.accessToken,
      embedUrl: embedInfo.embedUrl,
      id: embedInfo.reportId,
        tokenType: pbi.models.TokenType.Embed,
        permissions: pbi.models.Permissions.View,
        viewMode: pbi.models.ViewMode.View,
        settings: {
            filterPaneEnabled: false, 
        },
    };

    powerbi.embed(document.querySelector('#report-container'), config);

  }

  render() {
    return (
      <div>
            <h1>Barwood Report</h1>
        <div id='report-container' className='full-width'>
          Loading report ...
        </div>
      </div>
    );
  }
}