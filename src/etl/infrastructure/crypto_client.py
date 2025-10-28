import yfinance as yf

class CryptoClient:
    def __init__(self, debug_mode: bool = False):
        self.debug_mode = debug_mode

    def get_yahoo_data(self, symbol: str, period: str = "1d", interval: str = "1m"):
        if self.debug_mode:
            print(f"Fetching data for {symbol} from Yahoo Finance")
        """
        Fetch market data from Yahoo Finance efficiently.
        
        :param symbol: The trading pair symbol, e.g., 'BTC-USD'
        :param period: Time period (1d, 5d, 1mo, 3mo, 1y, etc.)
        :param interval: Data granularity (1m, 5m, 1h, 1d, etc.)
        """
        ticker = yf.Ticker(symbol)
        data = ticker.history(period=period, interval=interval)
        return data
