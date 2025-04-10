import configparser

class DBPropertyUtil:
    @staticmethod
    def getPropertyString(filename="db.properties"):
        config = configparser.ConfigParser()
        config.read(filename)
        db = config["database"]
        return (
            f"DRIVER={db['driver']};"
            f"SERVER={db['server']};"
            f"DATABASE={db['dbname']};"
            f"Trusted_Connection=yes;"
        )
