import posthog from 'posthog-js';
import { browser } from '$app/environment';

export const load = async () => {
  if (browser) {
    posthog.init('phc_IngEJBoFau2O75ublbDKRYcGaJWMd1kwgT21gU4dDJ5', {
      api_host: 'https://us.i.posthog.com'
    });
  }
  return;
};
