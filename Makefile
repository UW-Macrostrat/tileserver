serve:
	poetry run uvicorn macrostrat_tileserver.main:app --reload --port 8000